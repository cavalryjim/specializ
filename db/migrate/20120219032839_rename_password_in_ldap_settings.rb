class RenamePasswordInLdapSettings < ActiveRecord::Migration
  def self.up
    rename_column :ldap_settings, :password, :encrypted_password
  end

  def self.down
    rename_column :ldap_settings, :encrypted_password, :password
  end
end
