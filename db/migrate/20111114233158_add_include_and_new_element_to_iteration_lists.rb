class AddIncludeAndNewElementToIterationLists < ActiveRecord::Migration
  def self.up
    add_column :iteration_lists, :include, :boolean
    add_column :iteration_lists, :new_element, :boolean
  end

  def self.down
    remove_column :iteration_lists, :new_element
    remove_column :iteration_lists, :include
  end
end
