# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# puts "Destroying all users"
# User.destroy_all
# puts "Destroying all reviews"
# Review.destroy_all


# main user
# User.create({name: 'Sean'})

username = Faker::Internet.username
name_faker = Faker::Name

# Create Users
puts "Creating Users"
num_users = 0
100.times do
  User.create(name: name_faker.name)
  num_users += 1
end

puts "Created #{num_users} users"
