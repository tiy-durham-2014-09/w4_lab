# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.delete_all
List.delete_all
Todo.delete_all

@users = []

10.times do
  user = User.create!(name: Faker::Name.name,
               email: Faker::Internet.email,
               password: Faker::Internet.password)
  @users << user
end

@users.each do |u|
  rand(1..3).times do
    List.create!(user_id: u.id, name: ["Stuff", "Work", "Project X", "Bucket List", "list 7", "Must be done today"].sample )
  end
end

@users.each do |u|
  rand(2..10).times do
    task = [Faker::Hacker.verb, Faker::Hacker.adjective, Faker::Hacker.noun].join(" ")
    Todo.create!(user_id: u.id, list_id: u.lists.sample.id, name: task, note: Faker::Company.bs)
  end
end