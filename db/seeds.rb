# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'
users = 5.times.map do
  User.create(
    email: Faker::Internet.email,
    password: 'password',
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name
  )
end
shuffled_user_ids = users.map(&:id).shuffle
5.times do
  Cat.create(
    name: Faker::Creature::Cat.name,
    description: Faker::Lorem.sentence,
    age: Faker::Number.between(from: 1, to: 10),
    price_per_day: Faker::Number.between(from: 5, to: 20),
    user_id: shuffled_user_ids.pop
  )
end
