class CreateEquipment < ActiveRecord::Migration
  def self.up
    create_table :equipment do |t|
      t.integer :id
      t.string :name
      t.text :desc

      t.timestamps
    end
  end

  def self.down
    drop_table :equipment
  end
end
