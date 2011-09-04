class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :session
      t.float :t1
      t.float :t2
      t.float :t3

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
