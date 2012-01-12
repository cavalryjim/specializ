class AddDefaultValuesToCompanies < ActiveRecord::Migration
  def self.up
    change_column_default :companies, :active, true
    change_column_default :companies, :never_expires, false
  end

  def self.down
    change_column :companies, :active, :boolean, nil
    change_column :companies, :never_expires, :boolean, nil
  end
end
