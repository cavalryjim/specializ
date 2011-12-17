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
  
  validates :num, :presence => true
  validates :active, :inclusion => {:in => [true, false]}
  validates :topic_group_id, :presence => true
  
  def close
    self.elements.where('current = true').each do |element|
      element.compute_agreement(self.id)
    end
    self.active = false
    
    sum = self.iteration_lists.sum('agreement')
    included_elements = self.iteration_lists.count(:conditions => { :include => true })
    total_elements = self.iteration_lists.count
    consensus = (sum - (total_elements - included_elements) * 100 ) / included_elements
    self.consensus = !consensus.nan? ? consensus : 0
  
    return self.save
  end
  
  def start_new_iteration
    new_iteration = Iteration.new
    new_iteration.num = self.num + 1
    new_iteration.active = true
    new_iteration.topic_group_id = self.topic_group_id
    new_iteration.consensus = 0.0
    new_iteration.save
    self.iteration_lists.where('include = true').each do |old_iteration_list|
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
                                    :title => "Participation Level",
                                    :max_value => 100)
  end
  
  def reopen
    self.active = true
    self.save
    return self
  end
  
  def num_submitted_lists
    self.user_lists.count(:user_id, :distinct => true)
  end
  
end
