class AddDueDateToTopicGroups < ActiveRecord::Migration
  def self.up
    add_column :topic_groups, :due_date, :date
  end

  def self.down
    remove_column :topic_groups, :due_date
  end
end
