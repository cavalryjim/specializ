class AddElementTypeIdToElements < ActiveRecord::Migration
  def self.up
    add_column :elements, :element_type_id, :integer
  end

  def self.down
    remove_column :elements, :element_type_id
  end
end
