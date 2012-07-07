class Profile < ActiveRecord::Base
  attr_accessible :bio, :firstname, :lastname, :twitter, :user_id
  validates :firstname, :lastname, :user_id, :presence => true
  belongs_to :user
end
