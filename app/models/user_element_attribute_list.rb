# == Schema Information
#
# Table name: user_element_attribute_lists
#
#  id                   :integer(4)      not null, primary key
#  user_id              :integer(4)
#  element_attribute_id :integer(4)
#  value_num            :float
#  created_at           :datetime
#  updated_at           :datetime
#  value_str            :string(255)
#

class UserElementAttributeList < ActiveRecord::Base
  belongs_to :user
  belongs_to :element_attribute
  
  attr_accessible :user_id, :element_attribute_id, :value_num, :value_str
  
  #validates :user_id, :presence => true
  #validates :element_attribute_id, :presence => true
  #validates :value, :presence => true
  validates_associated :element_attribute
  validates_associated :user
  #validates :value_num, :numericality => true  #JDavis: is need to add a has_value_num? method.
  
end
