Photo.destroy_all
Category.destroy_all
Event.destroy_all
Profile.destroy_all
User.destroy_all

# Categories
programming = Category.create!(name: "Programming")
cooking = Category.create!(name: "Cooking")
languages = Category.create!(name: "Languages")

# Users
user1 = User.create!(
  email: "miriam@codaisseurbnb.com", password: "abcd1234"
)
user2 = User.create!(
  email: "wouter@codaisseurbnb.com", password: "abcd1234"
)
user3 = User.create!(
  email: "matt@codaisseurbnb.com", password: "abcd1234"
)

# Events
event_1 = Event.create!(
  name: Faker::Lorem.sentence(20),
  description: Faker::Lorem.sentence(50),
  location: Faker::Address.street_address,
  includes_food: true,
  includes_drinks: true,
  price: Faker::Commerce.price,
  starts_at: Faker::Date.forward(1) ,
  ends_at: Faker::Date.forward(2) ,
  capacity: Faker::Number.number(3),
  active: true,
  user: user1,
  categories: [programming, languages])

event_2 = Event.create!(
  name: Faker::Lorem.sentence(20),
  description: Faker::Lorem.sentence(50),
  location: Faker::Address.street_address,
  includes_food: true,
  includes_drinks: true,
  price: Faker::Commerce.price,
  starts_at: Faker::Date.forward(1) ,
  ends_at: Faker::Date.forward(2) ,
  capacity: Faker::Number.number(3),
  active: true,
  user: user1,
  categories: [cooking])

event_3 = Event.create!(
  name: Faker::Lorem.sentence(20),
  description: Faker::Lorem.sentence(50),
  location: Faker::Address.street_address,
  includes_food: true,
  includes_drinks: true,
  price: Faker::Commerce.price,
  starts_at: Faker::Date.forward(1) ,
  ends_at: Faker::Date.forward(2) ,
  capacity: Faker::Number.number(3),
  active: true,
  user: user2,
  categories: [languages])


  # Photos
  photo1 = Photo.create!(remote_image_url: "http://res.cloudinary.com/dfg4uic75/image/upload/v1507802271/hands-people-woman-meeting_sd92zy.jpg", event: event_1)
  photo1 = Photo.create!(remote_image_url: "http://res.cloudinary.com/dfg4uic75/image/upload/v1507802253/pexels-photo-169198_wxmimq.jpg", event: event_1)
  photo1 = Photo.create!(remote_image_url: "http://res.cloudinary.com/dfg4uic75/image/upload/v1507802230/pexels-photo-296878_gcaq9d.jpg", event: event_2)
  photo1 = Photo.create!(remote_image_url: "http://res.cloudinary.com/dfg4uic75/image/upload/v1507802206/pexels-photo-433452_m9vjdh.jpg", event: event_3)
