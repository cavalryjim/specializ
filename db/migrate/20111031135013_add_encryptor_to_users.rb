class AddEncryptorToUsers < ActiveRecord::Migration
   def self.up
    change_table(:users) do |t|
      t.string :encryptor
      t.string :pepper
    end
    
  end

  def self.down
    remove_column :users, :encryptor
    remove_column :users, :pepper
  end
end
