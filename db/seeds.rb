require 'faker'
user = User.create(
email: "diego@diego.com",
password: "123456" )

10.times do
  new_painting = Painting.create!(
name: Faker::Color.color_name,
user: user,
price: rand(1..10_000),
description: Faker::Movie )
end
