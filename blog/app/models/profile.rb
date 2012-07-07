class Profile < ActiveRecord::Base
  attr_accessible :bio, :birthdat, :color, :name, :twitter, :user_id
  belongs_to :user
end
