# == Schema Information
#
# Table name: element_attribute_types
#
#  id          :integer(4)      not null, primary key
#  name        :string(255)
#  description :string(255)
#  symbol      :string(255)
#  validation  :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

class ElementAttributeType < ActiveRecord::Base
  has_many :element_attributes
  
  attr_accessible :name, :description, :symbol, :validation
end
