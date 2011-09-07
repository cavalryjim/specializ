class CreateTopicGroups < ActiveRecord::Migration
  def self.up
    create_table :topic_groups do |t|
      t.string :name
      t.integer :goal
      t.boolean :active
      t.integer :update_frequency
      t.integer :topic_id
      t.integer :grouping_id

      t.timestamps
    end
  end

  def self.down
    drop_table :topic_groups
  end
end
