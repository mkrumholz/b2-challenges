# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Ride.destroy_all
Mechanic.destroy_all
AmusementPark.destroy_all

jim = Mechanic.create!(name: "Jim", years_experience: 17)
xena = Mechanic.create!(name: "Xena", years_experience: 23)

hershey = AmusementPark.create!(name: 'Hershey Park', price: 50.0)

tea_cups = jim.rides.create!(name: 'The Tea Cups', thrill_rating: 2, open: true, amusement_park: hershey)
tot = jim.rides.create!(name: 'Tower of Terror', thrill_rating: 8, open: true, amusement_park: hershey)
swings = jim.rides.create!(name: 'The Swings', thrill_rating: 5, open: true, amusement_park: hershey)
strawberry = jim.rides.create!(name: 'Strawberry Fields', thrill_rating: 3, open: false, amusement_park: hershey)
