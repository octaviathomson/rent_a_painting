
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
require "open-uri"
require 'faker'

User.destroy_all
user = User.create!(
email: "diego@diego.com",
password: "123456" )

Painting.destroy_all

10.times do
  file = URI.open('https://giantbomb1.cbsistatic.com/uploads/original/9/99864/2419866-nes_console_set.png')
  new_painting = Painting.create!(
    name: Faker::Color.color_name,
    user: user,
    artist: Faker::Artist.name,
    price: rand(1..10_000),
    description: Faker::Movie.quote)
  new_painting.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
end

