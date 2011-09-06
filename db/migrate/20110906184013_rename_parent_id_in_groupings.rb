class RenameParentIdInGroupings < ActiveRecord::Migration
  def self.up
    rename_column :groupings, :parent_grouping, :parent_id
    add_column :groupings, :lft, :integer
    add_column :groupings, :rgt, :integer
  end

  def self.down
    rename_column :groupings, :parent_id, :parent_grouping
    remove_column :groupings, :lft
    remove_column :groupings, :rgt
  end

end
