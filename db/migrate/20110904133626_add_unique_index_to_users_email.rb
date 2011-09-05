class AddUniqueIndexToUsersEmail < ActiveRecord::Migration
  def self.up
    add_index :users, :email, :name => 'users_uq1', :unique => true
  end

  def self.down
    remove_index :users, :name => :users_uq1
  end
end
