class CreateRegions < ActiveRecord::Migration
  def self.up
    create_table :regions do |t|
      t.integer :id
      t.string :name
      t.text :desc

      t.timestamps
    end
  end

  def self.down
    drop_table :regions
  end
end
