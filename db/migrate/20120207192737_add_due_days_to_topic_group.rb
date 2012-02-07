class AddDueDaysToTopicGroup < ActiveRecord::Migration
  def self.up
    add_column :topic_groups, :due_days, :integer
  end

  def self.down
    remove_column :topic_groups, :due_days
  end
end
