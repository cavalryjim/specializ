class AddElementAttributeTypeIdToElementAttributes < ActiveRecord::Migration
  def self.up
    remove_column :element_attributes, :input_type
    add_column :element_attributes, :element_attribute_type_id, :integer
  end

  def self.down
    add_column :element_attributes, :input_type, :string
    remove_column :element_attributes, :element_attribute_type_id
  end
end
