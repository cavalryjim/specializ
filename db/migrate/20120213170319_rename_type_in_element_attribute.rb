class RenameTypeInElementAttribute < ActiveRecord::Migration
  def self.up
    rename_column :element_attributes, :type, :input_type
  end

  def self.down
    rename_column :element_attricutes, :input_type, :type
  end
end
