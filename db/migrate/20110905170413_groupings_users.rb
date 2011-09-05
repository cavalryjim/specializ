class GroupingsUsers < ActiveRecord::Migration
  def self.up
    create_table :groupings_users, :id => false do |t|
      t.references :grouping, :null => false
      t.references :user, :null => false
    end
    add_index(:groupings_users, [:grouping_id, :user_id], :unique => true)
  end
  

  def self.down
    drop_table :groupings_users
  end
end
