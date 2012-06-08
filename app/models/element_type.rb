# == Schema Information
#
# Table name: element_types
#
#  id          :integer(4)      not null, primary key
#  name        :string(255)
#  description :string(255)
#  symbol      :string(255)
#  validation  :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

class ElementType < ActiveRecord::Base
  has_many :elements
  has_many :element_type_options
  
  attr_accessible :name, :description, :symbol, :validation
  validates :name,  :presence => true
  
  accepts_nested_attributes_for :element_type_options, :reject_if => lambda { |a| a[:name].blank? }, :allow_destroy => true
  
end
