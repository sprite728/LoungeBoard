class Room < ActiveRecord::Base
  attr_accessible :name
  has_many :bluetooths
  has_many :users,
           :through => :bluetooths
       
end
