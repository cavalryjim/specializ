class CreateIterationLists < ActiveRecord::Migration
  def self.up
    create_table :iteration_lists do |t|
      t.integer :iteration_id
      t.integer :element_id
      t.float :avg_score

      t.timestamps
    end
  end

  def self.down
    drop_table :iteration_lists
  end
end
