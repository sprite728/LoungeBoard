# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)
#User.delete_all

# Fake User 1
user = User.create(
  :email => "cchuang@server.com",
  :password => "12345",
  :password_confirmation => "12345"
)

user.create_profile(
  :firstname => "jeff",
  :lastname => "huang",
  :bio => "Ruby is lovely!"
)

# Fake User 2
user = User.create(
  :email => "lapita@badfood.com",
  :password => "specialcombo",
  :password_confirmation => "specialcombo"
)

user.create_profile(
  :firstname => "La",
  :lastname => "pita",
  :bio => "No one want to come."
)

# Fake User 3
user = User.create(
  :email => "inteco@server.com",
  :password => "pervasive",
  :password_confirmation => "pervasive"
)

user.create_profile(
  :firstname => "University of",
  :lastname => "Michigan",
  :bio => "We love Human-Computer Interaction!"
)



