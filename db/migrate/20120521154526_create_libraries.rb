class CreateLibraries < ActiveRecord::Migration
  def self.up
    create_table :libraries do |t|
      t.string :name
      t.string :number
      t.text :description
      t.integer :parent_id
      t.integer :lft
      t.integer :rgt
      t.integer :depth # this is optional.
      t.timestamps
    end
  end

  def self.down
    drop_table :libraries
  end
end
