class AddValidatedToLdapSettings < ActiveRecord::Migration
  def self.up
    add_column :ldap_settings, :validated, :boolean
  end

  def self.down
    remove_column :ldap_settings, :validated
  end
end
