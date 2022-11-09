# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.create(name: 'David', email: 'david@gmail.com', password: '123456', password_confirmation: '123456')
User.create(name: 'Dario', email: 'dario@gmail.com', password: '123456', password_confirmation: '123456')
User.create(name: 'Gabriel', email: 'gabriel@gmail.com', password: '123456', password_confirmation: '123456', role: 1)
Address.create(street: 'Calle 1', city: 'Bogota', country: 'Colombia', zip_code: '111111', number: 1)
Address.create(street: 'Calle 2', city: 'Taiwan', country: 'China', zip_code: '111111', number: 2)
Property.create(name: 'Casa 1', description: 'Casa 1', guest_capacity: 1, bedrooms: 1, beds: 1, bathrooms: 1, kind: 'apartment', address_id: 1, size: 1, user_id: 1)
BlockedPeriod.create(start_date: '2021-01-01', end_date: '2021-01-02', property_id: 1)
Category.create(name: 'Casa' , property_category_id: 1)