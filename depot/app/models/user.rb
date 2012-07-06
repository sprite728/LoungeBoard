class User < ActiveRecord::Base
  attr_accessible :hashed_password, :name, :salt
  has_one :profile
  has_many :articles
end
