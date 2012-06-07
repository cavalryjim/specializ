class AddMandatoryToElements < ActiveRecord::Migration
  def self.up
    add_column :elements, :mandatory, :boolean
  end

  def self.down
    remove_column :elements, :mandatory
  end
end
