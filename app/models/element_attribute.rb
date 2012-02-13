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
  
  attr_accessible :name, :type, :element_id
end
