# == Schema Information
#
# Table name: topics
#
#  id               :integer(4)      not null, primary key
#  name             :string(255)
#  description      :text
#  status           :integer(4)      default(1)
#  update_frequency :integer(4)
#  due_days         :integer(4)
#  opt_out          :boolean(1)
#  company_id       :integer(4)
#  created_at       :datetime
#  updated_at       :datetime
#  goal             :integer(4)
#  topic_type       :integer(4)      default(1)
#

class Topic < ActiveRecord::Base
  belongs_to :company
  
  has_many :groupings, :through => :topic_groups
  has_many :topic_groups, :dependent => :destroy
  has_many :libraries, :through => :topic_libraries
  has_many :topic_libraries, :dependent => :destroy
  
  attr_accessible :name, :description, :company_id, :status, :update_frequency, :due_days, :opt_out, :goal, :topic_type
  
  validates :name, :presence => true
  validates :company_id, :presence => true
  validates :goal, :inclusion => { :in => 1..100 }, :if => :consensus_topic?
  validates :status, :inclusion => { :in => 1..3 }
  validates :topic_type, :inclusion => { :in => 1..2 }
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
  
  def assign_libraries(library_ids)
    library_ids.each do |library_id|
      TopicLibrary.find_or_create_by_topic_id_and_library_id(self.id, library_id) 
    end
      
    libraries_to_remove = TopicLibrary.where(:topic_id => self.id).map(&:library_id) - library_ids.map(&:to_i)
      
    libraries_to_remove.each do |library_id|
      TopicLibrary.find_by_topic_id_and_library_id(self.id, library_id).destroy
    end
  end
  
  def has_update_frequency?
    update_frequency
  end
  
  def has_due_days?
    due_days
  end
  
  def consensus_topic?
    self.topic_type.nil? || self.topic_type == 1 
  end
  
  def check_for_restart
    true
  end
  
  def update_status
    self.close if self.status == 2
    self.archive if self.status == 3
  end
  
  def close
    self.topic_groups.where(:active => true).each do |topic_group|
      topic_group.close
    end
  end
  
  def archive
    self.close
  end
  
  def user_ids
    user_ids = []
    self.topic_groups.each do |topic_group|
      user_ids = user_ids + topic_group.user_ids
    end
    user_ids
  end
  
  def assignments
    assignments = []
    self.topic_groups.each do |topic_group|
      assignments = assignments + topic_group.assignments
    end
    assignments
  end
  
  def staff_topic(num)
    topic_groups = self.topic_groups
    percentage = num.to_f/100
    users = []
    
    topic_groups.each do |topic_group|
      group = Grouping.find(topic_group.grouping_id)
      users = group.user_list(percentage)
      topic_group.staff(users) if users.size > 0
    end  
  end
  
  def remove_all_participants
    Assignment.find_all_by_topic_group_id(self.topic_group_ids).each{ |a| a.delete } if self.topic_group_ids.size > 0
  end
  
  private
    
    
end



