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
#

class Library < ActiveRecord::Base
  acts_as_nested_set
  
  has_many :topics, :through => :topic_libraries
  has_many :topic_groups, :through => :topic_group_libraries
  has_many :library_objectives, :dependent => :destroy
  
  attr_accessible :name, :number, :description, :parent_id 
  
  def html_classes
    classes = ''
    
    self.ancestors.each do |group|
      classes = classes + "option_class" + group.id.to_s + ' '
    end
    
    classes
  end
  
  def display_name
    "#{' -' * self.level} #{self.name}"
  end
end
