class AddTopicGroupIdToElements < ActiveRecord::Migration
  def self.up
    add_column :elements, :topic_group_id, :integer
  end

  def self.down
    remove_column :elements, :topic_group_id
  end
end
