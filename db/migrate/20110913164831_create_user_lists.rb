class CreateUserLists < ActiveRecord::Migration
  def self.up
    create_table :user_lists do |t|
      t.integer :user_id
      t.integer :element_id
      t.integer :score
      t.integer :iteration_id

      t.timestamps
    end
  end

  def self.down
    drop_table :user_lists
  end
end
