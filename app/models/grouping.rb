# == Schema Information
#
# Table name: groupings
#
#  id          :integer(4)      not null, primary key
#  name        :string(255)
#  description :text
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
  #validates :company_id, :presence => true
  validates_associated :company
  validates_uniqueness_of :name, :scope => [ :company_id, :parent_id ]    # Unique for [name, company, parent]
  
  def fullname
    return self.self_and_ancestors.map(&:name).join("- ")
  end
  
  def to_s
    self.name
  end
  
  def add_to_topic(topic)
    topic_group = TopicGroup.find_or_initialize_by_topic_id_and_grouping_id(topic.id, self.id)
    topic_group.name = topic.name + ": " + self.fullname
    topic_group.goal = topic.goal
    if topic.due_days
      topic_group.due_date = topic.due_days.days.from_now 
      topic_group.due_days = topic.due_days
    end
    topic_group.update_frequency = topic.update_frequency if topic.update_frequency
    topic_group.active = true
    topic_group.save  
  end
  
  def remove_from_topic(topic_id)
    topic_group = TopicGroup.find_by_topic_id_and_grouping_id(topic_id, self.id)
    topic_group.destroy
  end
  
  def user_list(percentage)
    user_list = []
    self.self_and_descendants.each do |sub_group|
      if sub_group.users.size > 0
        #user_list = user_list + sub_group.users.order("RAND()").limit((sub_group.users.count*percentage).ceil)
        user_list = user_list + sub_group.users.sample((sub_group.users.count*percentage).ceil)
      end
    end
    return user_list
  end
  
  def import_groups(groups_spreadsheet)
    error_list = 0
    Spreadsheet.client_encoding = 'UTF-8'
      
    book = Spreadsheet.open groups_spreadsheet.path
    sheet1 = book.worksheet 0
    parent_list = []
    
    sheet1.each 1 do |row|  #JDavis: skipping the first row of the sheet.
      if row.length == 1
        parent_id = self.id 
      else
        parent_id = parent_list[row.length-2]
      end
      #parent_id = Grouping.find_all_by_name(row[1]).last.id || self.id
      name = row.last
      new_group = Grouping.find_or_initialize_by_name_and_parent_id_and_company_id(name, parent_id, self.company_id) 
      #new_group.company_id = self.company_id
      
      if new_group.save
        parent_list[row.length-1] = new_group.id 
      else
        error_list = error_list + 1  
      end
      
    end
    
    return error_list
  end

end
