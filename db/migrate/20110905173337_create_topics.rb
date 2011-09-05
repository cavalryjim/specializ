class CreateTopics < ActiveRecord::Migration
  def self.up
    create_table :topics do |t|
      t.string :name
      t.string :description
      t.integer :status
      t.integer :update_frequency
      t.integer :due_days
      t.boolean :opt_out
      t.integer :company_id

      t.timestamps
    end
  end

  def self.down
    drop_table :topics
  end
end
