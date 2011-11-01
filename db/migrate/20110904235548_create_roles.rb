class CreateRoles < ActiveRecord::Migration
  def self.up
    create_table :roles do |t|
      t.string :name
      t.string :description

      t.timestamps
    end
    
    Role.create(:name => 'employee', :description => 'This is the basic role that all users have.')
    Role.create(:name => 'manager', :description => 'This role is for users that will manage topics.')
    Role.create(:name => 'hr', :description => 'This role is for users that will manage users.')
    Role.create(:name => 'admin', :description => 'This role is for users that will manage the application.')
    Role.create(:name => 'pnetz_admin', :description => 'This is a super user role for Peoplenetz.')
  end

  def self.down
    drop_table :roles
  end
end
