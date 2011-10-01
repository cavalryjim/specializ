class CreateRoles < ActiveRecord::Migration
  def self.up
    create_table :roles do |t|
      t.string :name
      t.string :description

      t.timestamps
    end
    
    Role.create(:name => 'Employee', :description => 'This is the basic role that all users have.')
    Role.create(:name => 'Manager', :description => 'This role is for users that will manage topics.')
    Role.create(:name => 'HR', :description => 'This role is for users that will manage users.')
    Role.create(:name => 'Admin', :description => 'This role is for users that will manage the application.')
    Role.create(:name => 'Peoplenetz Admin', :description => 'This is a super user role for Peoplenetz.')
  end

  def self.down
    drop_table :roles
  end
end
