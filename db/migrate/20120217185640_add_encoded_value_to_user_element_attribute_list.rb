class AddEncodedValueToUserElementAttributeList < ActiveRecord::Migration
  def self.up
    remove_column :user_element_attribute_lists, :value
    add_column :user_element_attribute_lists, :encoded_value, :string
  end

  def self.down
    add_column :user_element_attribute_lists, :value, :float
    remove_column :user_element_attribute_lists, :encoded_value
  end
end
