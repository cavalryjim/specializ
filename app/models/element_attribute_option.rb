# == Schema Information
#
# Table name: element_attribute_options
#
#  id                   :integer(4)      not null, primary key
#  name                 :string(255)
#  element_attribute_id :integer(4)
#  created_at           :datetime
#  updated_at           :datetime
#

class ElementAttributeOption < ActiveRecord::Base 
  belongs_to :element_attribute

  attr_accessible :name, :element_attribute_id, :reject?
  validates_uniqueness_of :name, :scope => [ :element_attribute_id ]
  
  before_save :check_if_select
  
  def check_if_select
    if self.element_attribute.type != 'Select'
      false
    else
      true
    end
  end
  
end
