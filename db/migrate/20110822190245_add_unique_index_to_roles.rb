class AddUniqueIndexToRoles < ActiveRecord::Migration
  def self.up
    add_index :roles, :name, :name => 'roles_uq1', :unique => true
  end

  def self.down
    remove_index :roles, :roles_uq1
  end
end
