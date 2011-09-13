class CreateIterations < ActiveRecord::Migration
  def self.up
    create_table :iterations do |t|
      t.integer :num
      t.float :consensus
      t.boolean :active
      t.integer :topic_group_id

      t.timestamps
    end
  end

  def self.down
    drop_table :iterations
  end
end
