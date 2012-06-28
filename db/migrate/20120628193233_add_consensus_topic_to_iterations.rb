class AddConsensusTopicToIterations < ActiveRecord::Migration
  def self.up
    add_column :iterations, :consensus_topic, :boolean, :default => true
  end

  def self.down
    remove_column :iterations, :consensus_topic
  end
end
