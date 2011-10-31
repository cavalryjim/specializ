class AddAuthenticatableToUsers < ActiveRecord::Migration
  def self.up
    change_table(:users) do |t|
      t.string :encrypted_password
    end
    
  end

  def self.down
    remove_column :users, :encrypted_password
  end
end
