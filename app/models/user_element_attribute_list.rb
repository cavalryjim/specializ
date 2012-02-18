# == Schema Information
#
# Table name: user_element_attribute_lists
#
#  id                   :integer(4)      not null, primary key
#  user_id              :integer(4)
#  element_attribute_id :integer(4)
#  created_at           :datetime
#  updated_at           :datetime
#  encoded_value        :string(255)
#

# JDavis: the encoded_value should be stored as .to_yaml.  Use the 'encode' method below.
class UserElementAttributeList < ActiveRecord::Base
  belongs_to :user
  belongs_to :element_attribute
  
  attr_accessible :user_id, :element_attribute_id, :encoded_value
  
  validates :encoded_value, :presence => true
  validates_associated :element_attribute
  validates_associated :user
  
  def value
    YAML.parse(self.encoded_value).transform if self.encoded_value
  end
  
  def encode(value)
    self.encoded_value = value.to_yaml
  end
  
end
