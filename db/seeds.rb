Category.destroy_all
User.destroy_all

programming = Category.create!(name: "Programming")
cooking = Category.create!(name: "Cooking")
languages = Category.create!(name: "Languages")

arno = User.create!(
  email: 'arno@codaisseur.com',
  password: '123456'
)

Event.create!(
  name: "OpenHack Edition",
  description: "We are teaming up with Microsoft to bring you a special Circus event at De Hallen in Amsterdam West",
  location: "De Hallen Bellamystraat 1, Amsterdam",
  includes_food: true,
  includes_drinks: true,
  price: 10,
  starts_at: '%I:%M:%S %p',
  ends_at: '%I:%M:%S %p',
  capacity: 50,
  active: true,
  user: arno,
  categories: [programming])
