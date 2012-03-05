class ElementAttributeAnswer < ActiveRecord::Base
  belongs_to :element_attribute

  attr_accessible :name, :element_attribute_id
  validates_uniqueness_of :name, :scope => [ :element_attribute_id ]
end
