class CreateLibraryObjectives < ActiveRecord::Migration
  def self.up
    create_table :library_objectives do |t|
      t.string :name
      t.string :number
      t.text :description
      t.integer :library_id
      t.timestamps
    end
  end

  def self.down
    drop_table :library_objectives
  end
end
