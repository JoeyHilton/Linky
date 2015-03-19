# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create(email: "test@test.com", name: "Boss", password: "password", password_confirmation: "password")


5.times do 
  User.create(email: Faker::Internet.email,
              name: Faker::Name.name,
              password: "password",
              password_confirmation: "password")
end

30.times do
  Link.create(title: Faker::Lorem.sentence,
              url: Faker::Internet.url,
              votes: rand(-100..100))
end


