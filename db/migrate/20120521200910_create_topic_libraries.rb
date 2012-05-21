class CreateTopicLibraries < ActiveRecord::Migration
  def self.up
    create_table :topic_libraries do |t|
      t.integer :library_id
      t.integer :topic_id
      t.timestamps
    end
  end

  def self.down
    drop_table :topic_libraries
  end
end
