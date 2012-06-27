class AddEncodedValueToUserList < ActiveRecord::Migration
  def self.up
    add_column :user_lists, :encoded_value, :string
  end

  def self.down
    remove_column :user_lists, :encoded_value
  end
end
