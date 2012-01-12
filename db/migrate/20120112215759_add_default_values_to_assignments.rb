class AddDefaultValuesToAssignments < ActiveRecord::Migration
  def self.up
    change_column_default :assignments, :participating, true
    change_column_default :assignments, :manager, false
  end

  def self.down
    change_column :assignments, :participating, :boolean, nil
    change_column :assignments, :manager, :boolean, nil
  end
end
