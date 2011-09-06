class GroupingsLink < ActiveRecord::Migration
  def self.up
    create_table "groupings_link", :force => true, :id => false do |t|
       t.integer "grouping_a_id", :null => false
       t.integer "grouping_b_id", :null => false
    end
    add_index(:groupings_link, [:grouping_a_id, :grouping_b_id], :unique => true)
  end

  def self.down
    drop_table :groupings_link
  end
end
