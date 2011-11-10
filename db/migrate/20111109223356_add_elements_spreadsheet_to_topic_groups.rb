class AddElementsSpreadsheetToTopicGroups < ActiveRecord::Migration
  def self.up
    add_column :topic_groups, :elements_spreadsheet, :string
  end

  def self.down
    remove_column :topic_groups, :elements_spreadsheet
  end
end
