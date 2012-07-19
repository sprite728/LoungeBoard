class Bluetooth < ActiveRecord::Base
  attr_accessible :mac_addr, :user_id, :updated_at
  validates :mac_addr, :uniqueness => true,
                       :presence => true
  belongs_to :user
  belongs_to :room
end
