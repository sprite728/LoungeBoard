# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)
User.delete_all

user = User.create :email => "jeff@umich.edu", :password => "12345", :password_confirmation => "12345"
Category.create [ {:name => 'Programming'},
                  {:name => 'Technology'},
                  {:name => 'Circuits'},
                  {:name => 'Design'},
                  {:name => 'Travel'} ]
                  
user.articles.create :title => "I love interaction design!",
                     :body => "What is interaction design?",
                     :published_at => Date.today

user.articles.create :title => "One-to-many associations",
                     :body => "bala bala bala b..",
                     :published_at => Date.today
                     
user.articles.create :title => "How do you do?",
                     :body => "bala bala bala b..",
                     :published_at => Date.today                     
