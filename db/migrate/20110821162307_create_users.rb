class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :email, :null => false, :limit => 50
      t.column :pass, 'char(40)', :null => false
      t.column :salt, 'char(40)', :null => false
      t.column :activation_key, 'char(40)'
      t.column :state, 'char(40)', :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
