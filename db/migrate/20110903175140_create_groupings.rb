class CreateGroupings < ActiveRecord::Migration
  def self.up
    create_table :groupings do |t|
      t.string :name
      t.string :description
      t.integer :company_id
      t.integer :parent_grouping

      t.timestamps
    end
  end

  def self.down
    drop_table :groupings
  end
end
