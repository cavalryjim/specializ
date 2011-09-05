class RolesUsers < ActiveRecord::Migration
  def self.up
    create_table :roles_users, :id => false do |t|
      t.references :role, :null => false
      t.references :user, :null => false
    end
    add_index(:roles_users, [:role_id, :user_id], :unique => true)
  end
  

  def self.down
    drop_table :roles_users
  end
end
