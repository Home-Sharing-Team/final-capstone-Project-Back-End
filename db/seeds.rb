# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.create(name: 'David', email: 'david@gmail.com', password: '123456', password_confirmation: '123456')
User.create(name: 'Dario', email: 'dario@gmail.com', password: '123456', password_confirmation: '123456')
User.create(name: 'Gabriel', email: 'Gabriel@gmail.com', password: '123456', password_confirmation: '123456', role: 1)