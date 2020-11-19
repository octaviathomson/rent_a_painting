
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
require "open-uri"
require 'faker'
require 'json'
require 'pry'


User.destroy_all
user = User.create!(
email: "diego@diego.com",
password: "123456" )

Painting.destroy_all

file = URI.open("https://api.unsplash.com/search/photos/?page=1&per_page=100&client_id=oXs_0PdpJBx2lWawX7ReqSwfGJHQ9nadTC9SMpH7ZvM&query=painting")
parsed_file = JSON.parse(file.read)
image_results = parsed_file["results"]

image_results.each do |image_result|
  url = image_result["urls"]["regular"]
  file = URI.open(url)
  new_painting = Painting.new(
    name: Faker::Color.color_name,
    user: user,
    artist: Faker::Artist.name,
    # address: Faker::Address.full_address,
    price: rand(1..5000),
    description: Faker::Lorem.paragraphs)
  new_painting.photo.attach(io: file, filename: 'unsplash.png', content_type: 'image/png')
  new_painting.save!
end



# parsed_file.each (or some kind iteration - check what parsed_file gives you and see how to iterate over it so that it would return one url per painting) do |painting|

# …
# all the faker bits for name and user etc.
# ….
# new_painting.photo.attach(io: url, etc.)
# end iteration
