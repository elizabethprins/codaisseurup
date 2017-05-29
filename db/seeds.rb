# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Category.destroy_all
Photo.delete_all
Event.delete_all
Profile.delete_all


daytime = Category.create!(name: "Day Time")
outside = Category.create!(name: "Outside")
nighttime = Category.create!(name: "Night Time")
swimming_pool = Category.create!(name: "Swimming Pool")

elizabeth = User.create!(email: "elizabeth@codaisseurup.com", password: "abcd1234")
stranger = User.create!(email: "stranger@stranger.com", password: "abcd1234")

photo1 = Photo.create(remote_image_url: "http://res.cloudinary.com/elizabeth2000/image/upload/v1496054229/60sBBQ_qp2lyq.jpg")

event1 = Event.create!(name: "Hangout", description: "Normcore meh put a bird on it man braid mumblecore, locavore synth swag kogi helvetica ugh health goth twee raw denim readymade. Freegan yuccie everyday carry tote bag you probably haven't heard of them godard. Meditation tattooed lumbersexual street art truffaut pour-over, kale chips pitchfork. Readymade snackwave man bun, photo booth tilde wolf occupy fashion axe VHS authentic PBR&B typewriter. Vape everyday carry meditation try-hard hammock unicorn.", location: "The Spot", price: 5.5, capacity: 100, includes_food: true, includes_drinks: true, active: true, user: stranger, categories: [daytime, outside], photos: [photo1])

event2 = Event.create!(name: "Meeting", description: "Snaggeroni cuddleflush, leave smarting gallop about synth swag kogi helvetica ugh health goth twee raw denim readymade. Freegan yuccie everyday carry tote bag you probably haven't heard of them godard. Meditation tattooed lumbersexual street art truffaut pour-over, kale chips pitchfork. Readymade snackwave man bun, photo booth tilde wolf occupy fashion axe VHS authentic PBR&B typewriter. Vape everyday carry meditation try-hard hammock unicorn.", location: "The Other Spot", price: 10.5, capacity: 100, includes_food: false, includes_drinks: true, active: true, user: elizabeth, categories: [daytime, outside])
