# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'


User.destroy_all
Event.destroy_all
Attendance.destroy_all

5.times do 
  User.create(
    first_name: Faker::Name.first_name, 
    last_name: Faker::Name.last_name, 
    description: Faker::Lorem.sentence(word_count: 60 + rand(30)),
    email: Faker::Internet.email(domain: 'yopmail.com'),
    password: Faker::Internet.password
  )
end

puts "*" * 20
puts "Users created "

5.times do 
  Event.create(
    start_date: Faker::Time.between(from: DateTime.now + 1, to: DateTime.now + 100), 
    duration: [15, 30, 45, 60, 90].sample,
    title: Faker::Esport.event, 
    description: Faker::Lorem.sentence(word_count: 30 + rand(30)),
    price: [15, 25, 30, 40, 50].sample,
    location: Faker::Address.city,
    event_admin: User.all.sample
  )
end

puts "*" * 20
puts "Events created "

# 5.times do 
#   Attendance.create(
#     event_id: Event.all.sample.id,
#     user_id: User.all.sample.id
#   )
# end

#   puts "*" * 20
#   puts "Attendance created "