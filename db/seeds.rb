# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "open-uri"

def handle_string_io_as_file(io, filename)
  return io unless io.class == StringIO
  file = Tempfile.new(["temp",".png"], encoding: 'ascii-8bit')
  file.binmode
  file.write io.read
  file.open
end

puts "Lets go!"

LocationVote.destroy_all
DateVote.destroy_all
LocationChoice.destroy_all
DateChoice.destroy_all
Attendance.destroy_all
Hangout.destroy_all
User.destroy_all

puts "Old data wiped."

marco = User.create!(
  name: "Marco",
  email: "marco@gmail.com",
  password: "marcoquedem")

avatar_marco = URI.open('https://images.unsplash.com/photo-1518020382113-a7e8fc38eac9?ixlib=rb-1.2.1&auto=format&fit=crop&w=720&q=80')
marco.photo.attach(io: handle_string_io_as_file(avatar_marco, 'image.png'), filename: 'nes.png', content_type: 'image/png')

puts "created a user"

party = Hangout.create!(
  name: "Party at Marcos place",
  user_id: marco.id,
  description: 'Lets boogie'
  )

puts "Hangout created..."

location_1 = LocationChoice.create!(
  hangout_id: party.id,
  address: "333 Green St."
  )

location_2 = LocationChoice.create!(
  hangout_id: party.id,
  address: "2564 Seabreeze Way."
  )

location_3 = LocationChoice.create!(
  hangout_id: party.id,
  address: "4524 Tyne Blvd."
  )

puts "Location choices generated"

date_1 = DateChoice.create!(
  hangout_id: party.id,
  date: Time.now + 3.hours,
  )

date_2 = DateChoice.create!(
  hangout_id: party.id,
  date: Time.now + 1.day,
  )

date_3 = DateChoice.create!(
  hangout_id: party.id,
  date: Time.now + 1.week,
  )

puts "Date choices generated"


puts "More to come"
