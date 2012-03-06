class CreateElementAttributeOptions < ActiveRecord::Migration
  def self.up
    create_table :element_attribute_options do |t|
      t.string :name
      t.integer :element_attribute_id
      t.timestamps
    end
  end

  def self.down
    drop_table :element_attribute_options
  end
end
