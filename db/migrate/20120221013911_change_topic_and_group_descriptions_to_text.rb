class ChangeTopicAndGroupDescriptionsToText < ActiveRecord::Migration
  def self.up
    change_column :topics, :description, :text
    change_column :groupings, :description, :text
  end

  def self.down
    change_column :topics, :description, :string
    change_column :groupings, :description, :string
  end
end
