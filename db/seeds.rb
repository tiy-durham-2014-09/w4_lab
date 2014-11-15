# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Post.delete_all

# Post.create(
#   title: "My Very First Post",
#   body:
#   %Q{### There Is Something You Should Know!
#
#   This is my very first post using markdown!
#
#   How do you like it?  I learned this from [RichOnRails.com](http://richonrails.com/articles/rendering-markdown-with-redcarpet)!},
#   user: 'me',
#   published_date: Date.current - 1.day,
#
# )
#
# Post.create(
#   title: "My Second Post",
#   body:
#   %Q{### My List of Things To Do!
#
#   Here is the list of things I wish to do!
#
#   * write more posts
#   * write even more posts
#   * write even more posts!},
#   published_date: Date.current - 1.day
# )
