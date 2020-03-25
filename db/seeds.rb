# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "open-uri"

puts "Lets go!"

LocationChoice.destroy_all
DateChoice.destroy_all
Hangout.destroy_all
User.destroy_all

puts "Old data wiped."

marco = User.create!(
  name: "Marco",
  email: "marco@gmail.com",
  password: "marcoquedem")

puts "created a user"

party = Hangout.create!(
  name: "Party at Marcos place",
  user_id: marco.id,
  description: 'Lets boogie'
  )

puts "Hangout created..."

location_1 = LocationChoice.create!(
  hangout_id: party.id,
  location: "333 Green St."
  )

location_2 = LocationChoice.create!(
  hangout_id: party.id,
  location: "2564 Seabreeze Way."
  )

location_3 = LocationChoice.create!(
  hangout_id: party.id,
  location: "4524 Tyne Blvd."
  )

puts "Location choices generated"

date_1 = DateChoice.create!(
  hangout_id: party.id,
  date: Time.now + 3.hours,
  )

date_1 = DateChoice.create!(
  hangout_id: party.id,
  date: Time.now + 1.day,
  )

date_1 = DateChoice.create!(
  hangout_id: party.id,
  date: Time.now + 1.week,
  )

puts "Date choices generated"


puts "More to come"
