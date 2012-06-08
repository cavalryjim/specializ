class RenameValueInElementTypeOption < ActiveRecord::Migration
  def self.up
    rename_column :element_type_options, :value, :encoded_value
  end

  def self.down
    rename_column :element_type_options, :encoded_value, :value
  end
end
