class AddTypeToTopics < ActiveRecord::Migration
  def self.up
    add_column :topics, :topic_type, :integer
    change_column_default :topics, :topic_type, 1
  end

  def self.down
    remove_column :topics, :topic_type
  end
end
