User.destroy_all

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
  user: arno)
