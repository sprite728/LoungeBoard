class Bluetooth < ActiveRecord::Base
  attr_accessible :macaddr
  validates :macaddr, :presence => true, :uniqueness => true
  belongs_to :user
end
