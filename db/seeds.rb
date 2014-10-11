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


50.times do

  fake_name = Faker::Name.name
  user = User.create!(name: fake_name,
                      handle: Faker::Internet.user_name(fake_name),
                      email: Faker::Internet.free_email(fake_name),
                      password: "password")

  Profile.create!(user: user,
                  bio: Faker::Lorem.paragraph(2),
                  location: ["North Carolina", "USA", "San Diego", "NYC, NY"].sample,
                  website: Faker::Internet.domain_name)

  rand(2..10).times do
    Post.create!(user: user,
                 message: Faker::Lorem.sentence(1,false,20).to_s.truncate(141),
                 location: [Faker::Address.country, Faker::Address.state, Faker::Address.city].sample)
  end
end

def make_relationships
	users = User.all
	user  = users.sample(30)
	followed_users = users[2..50]
	followers      = users[2..40]
	followed_users.each { |followed| user.follow!(followed) }
	followers.each      { |follower| follower.follow!(user) }
end

make_relationships