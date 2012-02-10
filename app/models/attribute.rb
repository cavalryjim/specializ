class Attribute < ActiveRecord::Base
  belongs_to :element
  
  attr_accessible :name, :type, :element_id
  validates :name, :presence => true
end
