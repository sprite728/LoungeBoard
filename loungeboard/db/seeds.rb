# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)

User.delete_all
Bluetooth.delete_all
Room.delete_all

# Create a room called PhDOffice, and it's visitors
room = Room.create(:name => "phd_office")

user = User.create(:name => "MarkNewman", :email => "marknewman@jeff.com", :password => "rocknroll", :password_confirmation => "rocknroll", :twitter => "marknewman")
user.bluetooth = Bluetooth.create(:mac_addr => "39:39:10:10:40:40")
room.bluetooths << user.bluetooth 

user = User.create(:name => "StanleyArmuro", :email => "stanley@jeff.com", :password => "armuro", :password_confirmation => "armuro", :twitter => "umich")
user.bluetooth = Bluetooth.create(:mac_addr => "39:39:40:10:1E:40")
room.bluetooths << user.bluetooth 

user = User.create(:name => "Sprite", :email => "sprite@jeff.com", :password => "magic", :password_confirmation => "magic", :twitter => "sprite728")
user.bluetooth = Bluetooth.create(:mac_addr => "39:39:40:10:1E:FF")
room.bluetooths << user.bluetooth 