class CreateTariffs < ActiveRecord::Migration
  def self.up
    create_table :tariffs do |t|
      t.integer :id
      t.string :name
      t.string :type
      t.float :t1
      t.float :t2
      t.float :t3
      t.integer :region_id
      t.integer :equipment_id

      t.timestamps
    end
  end

  def self.down
    drop_table :tariffs
  end
end
