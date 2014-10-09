require "faker"

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.delete_all
Post.delete_all
Profile.delete_all


20.times do
  user = User.create!(name: Faker::Name.name,
                      handle: Faker::Internet.user_name,
                      email: Faker::Internet.email,
                      password: Faker::Internet.password)

  Profile.create!(user: user,
                  bio: Faker::Lorem.paragraph(2),
                  location: ["North Carolina", "USA", "San Diego", "NYC, NY"].sample,
                  website: Faker::Internet.domain_name)

  rand(2..10).times do
    Post.create!(user: user,
                 message: Faker::Lorem.characters(10..141),
                 location: [Faker::Address.country, Faker::Address.state, Faker::Address.city].sample)
  end
end
