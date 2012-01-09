# == Schema Information
#
# Table name: groupings
#
#  id          :integer(4)      not null, primary key
#  name        :string(255)
#  description :string(255)
#  company_id  :integer(4)
#  parent_id   :integer(4)
#  created_at  :datetime
#  updated_at  :datetime
#  lft         :integer(4)
#  rgt         :integer(4)
#

class Grouping < ActiveRecord::Base
  acts_as_nested_set
  belongs_to :company
  has_and_belongs_to_many :users, :uniq => true
  has_many :topics, :through => :topic_groups
  has_many :topic_groups, :dependent => :destroy
  
  attr_accessible :name, :description, :company_id, :parent_id
  #attr_protected :lft, :rgt
 
  validates :name, :presence => true
  validates :company_id, :presence => true
  validates_uniqueness_of :name, :scope => [ :company_id, :parent_id ]    # Unique for [name, company, parent]
  
  def fullname
    return self.self_and_ancestors.map(&:name).join("- ")
  end
  
  def add_to_topic(topic)
    topic_group = TopicGroup.find_or_initialize_by_topic_id_and_grouping_id(topic.id, self.id)
    topic_group.name = topic.name + ": " + self.fullname
    topic_group.goal = topic.goal
    topic_group.active = true
    return topic_group.save  
  end
  
  def remove_from_topic(topic_id)
    topic_group = TopicGroup.find_by_topic_id_and_grouping_id(topic_id, self.id)
    topic_group.destroy
  end
  
  def user_list(percentage)
    user_list = []
    self.self_and_descendants.each do |sub_group|
      if sub_group.users.size > 0
        user_list = user_list + sub_group.users.order("RAND()").limit((sub_group.users.count*percentage).ceil)
      end
    end
    return user_list
  end

end
