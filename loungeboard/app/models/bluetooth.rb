class Bluetooth < ActiveRecord::Base
  attr_accessible :mac_addr, :user_id
  validates :mac_addr, :uniqueness => true,
                       :presence => true
  belongs_to :user
end
