class AddValueStrToUserElementAttributeList < ActiveRecord::Migration
  def self.up
    add_column :user_element_attribute_lists, :value_str, :string
  end

  def self.down
    remove_column :user_element_attribute_lists, :value_str
  end
end
