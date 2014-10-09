# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

10.times do User.create!([ name: Faker::Name.name, email: Faker::Internet.email, password: Faker::Lorem.word])
end

10.times do Post.create!([ title: Faker::Company.catch_phrase, published_date: Faker::Time.between(250.days.ago, Time.now), content: Faker::Lorem.paragraph])
end
