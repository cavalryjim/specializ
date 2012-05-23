class AddCompanyIdToLibraries < ActiveRecord::Migration
  def self.up
    add_column :libraries, :company_id, :integer
  end

  def self.down
    remove_column :libraries, :company_id
  end
end
