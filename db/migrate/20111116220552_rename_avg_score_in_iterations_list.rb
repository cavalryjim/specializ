class RenameAvgScoreInIterationsList < ActiveRecord::Migration
  def self.up
    rename_column :iteration_lists, :avg_score, :agreement
  end

  def self.down
    rename_column :iteration_lists, :agreement, :avg_score
  end
end
