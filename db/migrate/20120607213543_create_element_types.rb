class CreateElementTypes < ActiveRecord::Migration
  def self.up
    create_table :element_types do |t|
      t.string :name
      t.string :description
       t.string :symbol
      t.string :validation 

      t.timestamps
    end
  end

  def self.down
    drop_table :element_types
  end
end
