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
Category.create(name: 'beach_test')
Category.create(name: 'mountain_test')
Category.create(name: 'city_test')
Property.create(name: 'Casa 1', description: 'Casa 1', guest_capacity: 1, bedrooms: 1, beds: 1, bathrooms: 1, kind: 'apartment', address_id: 1, size: 1, user_id: 1)
Property.create(name: 'Casa 2', description: 'Casa 2', guest_capacity: 2, bedrooms: 2, beds: 2, bathrooms: 2, kind: 'house', address_id: 2, size: 2, user_id: 2)
Property.create(name: 'Casa 3', description: 'Casa 3', guest_capacity: 3, bedrooms: 3, beds: 3, bathrooms: 3, kind: 'apartment', address_id: 1, size: 3, user_id: 3)
Hosting.create(cycle: 1, minimum_cycle_amount: 1, rate: 1, public: true, cleaning_fee: 1, user_id: 1, property_id: 17)
Hosting.create(cycle: 2, minimum_cycle_amount: 2, rate: 12, public: true, cleaning_fee: 1, user_id: 2, property_id: 18)
BlockedPeriod.create(start_date: '2021-01-01', end_date: '2021-01-02', property_id: 1)
Reservation.create(check_in: '2021-01-01', check_out: '2021-01-02', guests: 1, user_id: 1, hosting_id: 3, )


#Property_image.create(property_id: 1, image: 'https://images.unsplash.com/photo-1610078888889-1b1b1b1b1b1b?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80')