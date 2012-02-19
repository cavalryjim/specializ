class CreateLdapSettings < ActiveRecord::Migration
  def self.up
    create_table :ldap_settings do |t|
      t.integer :company_id
      t.string :server_address
      t.integer :port_number 
      t.string :user_name 
      t.string :password 
      t.string :root_node 
      t.string :account_attribute_name 
      t.string :group_attribute_name
      t.string :group_member_attribute 
      t.string :group_names 
      t.timestamps
    end
  end

  def self.down
    drop_table :ldap_settings
  end
end
