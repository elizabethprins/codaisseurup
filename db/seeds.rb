# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all

elizabeth = User.create!(email: "elizabeth@codaisseurup.com", password: "abcd1234")

event = Event.create!(name: "Hangout", description: "Normcore meh put a bird on it man braid mumblecore, locavore synth swag kogi helvetica ugh health goth twee raw denim readymade. Freegan yuccie everyday carry tote bag you probably haven't heard of them godard. Meditation tattooed lumbersexual street art truffaut pour-over, kale chips pitchfork. Readymade snackwave man bun, photo booth tilde wolf occupy fashion axe VHS authentic PBR&B typewriter. Vape everyday carry meditation try-hard hammock unicorn.", location: "The Spot", price: 5.5, capacity: 100, includes_food: true, includes_drinks: true, active: true, user: elizabeth)
