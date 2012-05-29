# == Schema Information
#
# Table name: libraries
#
#  id          :integer(4)      not null, primary key
#  name        :string(255)
#  number      :string(255)
#  description :text
#  parent_id   :integer(4)
#  lft         :integer(4)
#  rgt         :integer(4)
#  depth       :integer(4)
#  created_at  :datetime
#  updated_at  :datetime
#  company_id  :integer(4)
#

class Library < ActiveRecord::Base
  acts_as_nested_set
  
  belongs_to :company
  has_many :topics, :through => :topic_libraries
  has_many :topic_groups, :through => :topic_group_libraries
  has_many :library_objectives, :dependent => :destroy
  
  attr_accessible :name, :number, :description, :parent_id 
  
  def display_name
    "#{' -' * self.level} #{self.name}"
  end
  
  def to_s
    self.name
  end
  
  def fullname
    self.self_and_ancestors.map(&:name).join("- ")
  end
  
  def add_to_topic(topic)
    TopicLibrary.find_or_create_by_topic_id_and_library_id(topic.id, self.id) 
  end
  
  def remove_from_topic(topic_id)
    TopicLibrary.find_by_topic_id_and_library_id(topic_id, self.id).destroy
  end
  
  def selected?(topic_id)
    TopicLibrary.find_by_topic_id_and_library_id(topic_id, self.id)
  end
  
  def descendants_selected?(topic_id)
    descendants_selected = false
    self.descendants.each do |group|
      descendants_selected = true if group.selected?(topic_id)
    end
    descendants_selected
  end
  
  def parent?
    self.children.size > 0
  end
  
  def html_class
    str = ""
    str = "parent " if self.parent?
    if self.child? 
      str = str + "child-of-node--" + self.ancestors.map(&:id).join("-") 
      self.ancestors.each do |group|
        str = str + "option_class" + group.id.to_s + ' '
      end
    end
    return str
  end
  

  def html_classes
    classes = 'class="  '
    
    self.ancestors.each do |group|
      classes = classes + "option_class" + group.id.to_s + ' '
    end
   
    classes = classes + '"'
  end
  
  def add_description(description)
    self.description = description
    self.save
  end
  
  def add_number(number)
    self.number = number
    self.save
  end
  
  def import_objectives(objectives_spreadsheet)
    Spreadsheet.client_encoding = 'UTF-8'
      
    book = Spreadsheet.open objectives_spreadsheet.path
  
    sheet1 = book.worksheet 0
    sheet1.each 1 do |row|  #JDavis: skipping the first row of the sheet.
      objective = LibraryObjective.new
      objective.number = row[0]
      objective.name = row[1]
      objective.description = row[2]
      objective.library_id = self.id
      objective.save  
    end  
    
  end
  
end
