class AddDefaultValuesToTopicGroups < ActiveRecord::Migration
  def self.up
    change_column_default :topic_groups, :active, true
  end

  def self.down
    change_column :topic_grouops, :active, :boolean, nil
  end
end
