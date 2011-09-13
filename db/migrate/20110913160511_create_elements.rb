class CreateElements < ActiveRecord::Migration
  def self.up
    create_table :elements do |t|
      t.string :name
      t.boolean :current
      t.integer :created_by
      t.integer :edited_by

      t.timestamps
    end
  end

  def self.down
    drop_table :elements
  end
end
