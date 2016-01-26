# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

admin   = User.create(email: 'admin@example.com'  , password: 'password', admin: 1)
general = User.create(email: 'general@example.com', password: 'password')

Article.create(user: admin  , title: 'test1', content: 'test1')
Article.create(user: general, title: 'test2', content: 'test2')
