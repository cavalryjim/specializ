# == Schema Information
#
# Table name: user_element_attribute_lists
#
#  id                   :integer(4)      not null, primary key
#  user_id              :integer(4)
#  element_attribute_id :integer(4)
#  value                :float
#  created_at           :datetime
#  updated_at           :datetime
#

class UserElementAttributeList < ActiveRecord::Base
  belongs_to :user
  belongs_to :element_attribute
  
  validates :user_id, :presence => true
  validates :element_attribute_id, :presence => true
  validates :value, :presence => true
end
