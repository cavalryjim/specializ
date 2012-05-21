class CreateTopicGroupLibraries < ActiveRecord::Migration
  def self.up
    create_table :topic_group_libraries do |t|
      t.integer :library_id
      t.integer :topic_group_id
      t.timestamps
    end
  end

  def self.down
    drop_table :topic_group_libraries
  end
end
