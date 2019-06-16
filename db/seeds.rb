# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Faker::Config.locale = 'en-US'
10.times do
  ContentItem.create(title: Faker::Book.title,
                     author: Faker::Book.author,
                     published_date: Faker::Date.backward(1000).to_date,
                     summary: Faker::Lorem.words(rand(2..10)).join(" "),
                     content: Faker::Lorem.paragraphs(rand(2..8)).join(" "),
                     status: Faker::Number.between(0,1))
end