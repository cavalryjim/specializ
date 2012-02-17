# == Schema Information
#
# Table name: element_attributes
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  input_type :string(255)
#  element_id :integer(4)
#  created_at :datetime
#  updated_at :datetime
#

class ElementAttribute < ActiveRecord::Base
  belongs_to :element
  has_many   :user_element_attribute_lists, :dependent => :destroy
  has_many   :users, :through => :user_element_attribute_lists
  
  attr_accessible :name, :input_type, :element_id
  #validates :name,  :presence => true
  validates_associated :element
  validates_uniqueness_of :name, :scope => [ :element_id ]
  
  def value(user_id)
    attr_list = UserElementAttributeList.find_by_element_attribute_id_and_user_id(self.id, user_id)
    return attr_list.nil? ? nil : attr_list.value
  end
  
end
