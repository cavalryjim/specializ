class AddDescriptionToElements < ActiveRecord::Migration
  def self.up
    add_column :elements, :description, :text
  end

  def self.down
    remove_column :elements, :description
  end
end
