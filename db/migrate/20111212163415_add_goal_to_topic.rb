class AddGoalToTopic < ActiveRecord::Migration
  def self.up
    add_column :topics, :goal, :integer
    
  end

  def self.down
    remove_column :topics, :goal
  end
end
