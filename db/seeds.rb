# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


City.create(city_name: "Paris")
City.create(city_name: "Lyon")
City.create(city_name: "Marseille")
City.create(city_name: "Guingamp")
City.create(city_name: "Lille")
City.create(city_name: "Toulouse")

Tag.create(tag_name: "Végétarien")
Tag.create(tag_name: "Vegan")
Tag.create(tag_name: "Halal")
Tag.create(tag_name: "Casher")
Tag.create(tag_name: "Sans gluten")
Tag.create(tag_name: "Sain")
Tag.create(tag_name: "Gras")

20.times do |user|
  User.create(email: (Faker::Superhero.power + "@blabla.com"),password: Faker::Superhero.power, first_name: Faker::Superhero.prefix, last_name: Faker::Superhero.suffix, birth_day: Faker::Date.birthday(min_age:18, max_age:100), gender: "unknown", is_host: false)
end

30.times do |event|
  Event.create(title: Faker::Food.dish, description: Faker::Food.description, date: Faker::Date.forward(days: 100), guests_number: rand(1..6), city_id: rand(1..5), host_id: rand(1..User.count), current_guests: 0)
end

60.times do |filter|
  Filter.create(event_id: rand(1..30), tag_id: rand(1..5))
end

30.times do |appointment|
  Appointment.create(user_id: rand(1..User.count), event_id: rand(1..30))
end