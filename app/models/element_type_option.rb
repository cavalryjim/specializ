# == Schema Information
#
# Table name: element_type_options
#
#  id              :integer(4)      not null, primary key
#  name            :string(255)
#  encoded_value   :string(255)
#  element_type_id :integer(4)
#  created_at      :datetime
#  updated_at      :datetime
#

class ElementTypeOption < ActiveRecord::Base
  belongs_to :element_type
  
  attr_accessible :name, :encoded_value, :element_type_id
  validates :name,  :presence => true
  validates :element_type_id, :presence => true
  validates_associated :element_type
  
  def value
    YAML.parse(self.encoded_value).transform if self.encoded_value
  end
  
  def encode(value)
    self.encoded_value = value.to_yaml
  end
end
