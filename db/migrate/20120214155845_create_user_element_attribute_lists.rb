class CreateUserElementAttributeLists < ActiveRecord::Migration
  def self.up
    create_table :user_element_attribute_lists do |t|
      t.integer :user_id
      t.integer :element_attribute_id
      t.float :value

      t.timestamps
    end
  end

  def self.down
    drop_table :user_element_attribute_lists
  end
end
