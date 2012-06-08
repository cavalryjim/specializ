class CreateElementTypeOptions < ActiveRecord::Migration
  def self.up
    create_table :element_type_options do |t|
      t.string :name
      t.string :value
      t.integer :element_type_id

      t.timestamps
    end
  end

  def self.down
    drop_table :element_type_options
  end
end
