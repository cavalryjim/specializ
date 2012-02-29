# == Schema Information
#
# Table name: topics
#
#  id               :integer(4)      not null, primary key
#  name             :string(255)
#  description      :string(255)
#  status           :integer(4)      default(1)
#  update_frequency :integer(4)
#  due_days         :integer(4)
#  opt_out          :boolean(1)
#  company_id       :integer(4)
#  created_at       :datetime
#  updated_at       :datetime
#  goal             :integer(4)
#

class Topic < ActiveRecord::Base
  belongs_to :company
  has_many :topic_groups, :dependent => :destroy
  has_many :groupings, :through => :topic_groups
  
  attr_accessible :name, :description, :company_id, :status, :update_frequency, :due_days, :opt_out, :goal
  
  validates :name, :presence => true
  validates :company_id, :presence => true
  validates :goal, :inclusion => { :in => 1..100 }
  validates :status, :inclusion => { :in => 1..3 }
  validates_uniqueness_of :name, :scope => [ :company_id ]    # Unique for [name, company]
  validates :update_frequency, :numericality => { :only_integer => true, :greater_than => 0 }, :if => :has_update_frequency?
  validates :due_days, :numericality => { :only_integer => true, :greater_than => 0 }, :if => :has_due_days?
  validates_associated :company
  
  after_save :update_status
  
  def to_param
    "#{id}-#{name.parameterize}"
  end
  
  def to_s
    self.name
  end
  
  def update_groupings(grouping_ids)
    
    grouping_ids.each do |grouping_id|
      grouping = Grouping.find(grouping_id)
      grouping.add_to_topic(self)
    end
      
    groups_to_remove = TopicGroup.where(:topic_id => self.id).map(&:grouping_id) - grouping_ids.map(&:to_i)
      
    groups_to_remove.each do |grouping_id|
      grouping = Grouping.find(grouping_id)
      grouping.remove_from_topic(self.id)
    end
  end
  
  def has_update_frequency?
    update_frequency
  end
  
  def has_due_days?
    due_days
  end
  
  def check_for_restart
    true
  end
  
  def update_status
    self.close if self.status == 2
    self.archive if self.status == 3
  end
  
  def close
    self.topic_groups.where('active = true').each do |topic_group|
      topic_group.close
    end
  end
  
  def archive
    self.close
    
  end
  
  private
    
    
end



