class RenameValueInUserElementAttributeList < ActiveRecord::Migration
  def self.up
    rename_column :user_element_attribute_lists, :value, :value_num
  end

  def self.down
    rename_column :user_element_attribute_lists, :value_num, :value
  end
end
