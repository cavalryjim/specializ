class CreateAssignments < ActiveRecord::Migration
  def self.up
    create_table :assignments do |t|
      t.integer :user_id
      t.integer :topic_group_id
      t.boolean :manager
      t.boolean :participating

      t.timestamps
    end
  end

  def self.down
    drop_table :assignments
  end
end
