class AddDefaultValuesToTopics < ActiveRecord::Migration
  def self.up
    change_column_default :topics, :status, 1
  end

  def self.down
    change_column :topics, :status, :integer, nil
  end
end
