class Role < ActiveRecord::Base
  validates :name, :presence => true, :uniqueness => true, :length => { :maximum => 255 }
  validates :description, :length => { :maximum => 255 }
end
