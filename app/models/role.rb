class Role < ActiveRecord::Base
  has_many :users, :dependent => :restrict

  validates :name, :presence => true, :uniqueness => true, :length => { :maximum => 255 }
  validates :description, :length => { :maximum => 255 }
end
