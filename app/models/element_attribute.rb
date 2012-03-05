# == Schema Information
#
# Table name: element_attributes
#
#  id                        :integer(4)      not null, primary key
#  name                      :string(255)
#  element_id                :integer(4)
#  created_at                :datetime
#  updated_at                :datetime
#  element_attribute_type_id :integer(4)
#

class ElementAttribute < ActiveRecord::Base
  belongs_to :element
  belongs_to :element_attribute_type
  has_many   :user_element_attribute_lists, :dependent => :destroy
  has_many   :users, :through => :user_element_attribute_lists
  has_many   :element_attribute_answers, :dependent => :destroy
  
  attr_accessible :name, :element_id, :element_attribute_type_id, :element_attribute_answers_attributes
  #validates :name,  :presence => true
  validates_associated :element
  #validates_associated :element_attribute_type
  validates_uniqueness_of :name, :scope => [ :element_id ]
  
  accepts_nested_attributes_for :element_attribute_answers, :reject_if => lambda { |a| a[:name].blank? }, :allow_destroy => true
  
  def value(user_id)
    user_e_attr_list = UserElementAttributeList.find_by_element_attribute_id_and_user_id(self.id, user_id)
    user_e_attr_list.nil? ? nil : user_e_attr_list.value
  end
  
  def symbol
    ElementAttributeType.find(self.element_attribute_type_id).symbol
  end
  
end
