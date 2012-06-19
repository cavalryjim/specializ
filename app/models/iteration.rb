# == Schema Information
#
# Table name: iterations
#
#  id             :integer(4)      not null, primary key
#  num            :integer(4)
#  consensus      :float
#  active         :boolean(1)
#  topic_group_id :integer(4)
#  created_at     :datetime
#  updated_at     :datetime
#

class Iteration < ActiveRecord::Base
  belongs_to :topic_group
  has_many :iteration_lists, :dependent => :destroy
  has_many :elements, :through => :iteration_lists
  has_many :user_lists, :dependent => :destroy
  has_many :users, :through => :user_lists
  has_many :new_elements, :through => :iteration_lists,
           :class_name => "Element",
           :source => :element,
           :conditions => ['iteration_lists.new_element = ?', true] 
  has_many :current_elements, :through => :iteration_lists,
           :class_name => "Element",
           :source => :element,
           :conditions => ['iteration_lists.new_element = false', 'iteration_lists.include = true']
  
  validates :num, :presence => true
  validates :active, :inclusion => {:in => [true, false]}
  validates :topic_group_id, :presence => true
  
  def to_param
    "#{id}-#{num}"
  end
  
  def to_s
    "#{num}"
  end
  
  def close(alert_manager = false)
    
    if self.topic_group.topic.topic_type.nil? || self.topic_group.topic.topic_type == 1
      
      self.current_elements.each do |element|
        element.compute_agreement(self.id)
      end
      
      sum = self.iteration_lists.sum('agreement')
      included_elements = self.iteration_lists.where(:include => true, :new_element => false).size
      total_elements = self.iteration_lists.where(:new_element => false).size
      if included_elements > 0
        consensus = (sum - (total_elements - included_elements) * 100 ) / included_elements
      else
        consensus = 0.1 #JDavis: changing this to .1 because the barchart did not like 0
      end
      #self.consensus = consensus.nan? ? 0 : consensus
      self.consensus = consensus
      
    end
    
    if alert_manager
      TopicGroup.find(self.topic_group_id).managers.each do |manager|
        manager.notify_iteration_close(self.id)
      end
    end
  
    self.active = false
    return self.save
  end
  
  def start_new_iteration
    new_iteration = Iteration.new
    new_iteration.num = self.num + 1
    new_iteration.active = true
    new_iteration.topic_group_id = self.topic_group_id
    new_iteration.consensus = 0.0
    new_iteration.save
    self.iteration_lists.where(:include => true).each do |old_iteration_list|
      new_iteration_list = IterationList.new
      new_iteration_list.iteration_id = new_iteration.id
      new_iteration_list.element_id = old_iteration_list.element_id
      new_iteration_list.include = true
      new_iteration_list.new_element = false
      new_iteration_list.save
    end
    
    return new_iteration
  end
  
  def completion_meter(submitted, total)
    completion_percentage = (submitted.to_f / total.to_f) * 100
    completion_meter = Gchart.meter(:data => [completion_percentage], 
                                    :title => completion_percentage.to_s + "% participation rate this iteration",
                                    :max_value => 100)
  end
  
  def reopen
    self.active = true
    self.save
    return self
  end
  
  def num_submitted_lists
    #self.user_lists.count(:user_id, :distinct => true)
    self.users.uniq.size
  end
  
  def last?
    self == self.topic_group.iterations.last
  end
  
end
