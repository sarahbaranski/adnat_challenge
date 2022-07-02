# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(organisation_id: 1, name: "Anna", email_address: "anna@test.com", password: "password")
User.create!(organisation_id: 2, name: "Rachel", email_address: "rachel@test.com", password: "password")
User.create!(organisation_id: 3, name: "Steve", email_address: "steve@test.com", password: "password")
User.create!(organisation_id: 4, name: "Ryan", email_address: "ryan@test.com", password: "password")

Organisation.create!(name: "Target", hourly_rate: 12.00)
Organisation.create!(name: "Walmart", hourly_rate: 10.00)
Organisation.create!(name: "Kroger", hourly_rate: 11.00)
Organisation.create!(name: "Jewel", hourly_rate: 9.50)
Organisation.create!(name: "Trader Joes", hourly_rate: 18.00)

Shift.create!(user_id: 1, start: Time.new(2021, 9, 6, 9, 0, 0, "+00:00"), finish: Time.new(2021, 6, 6, 17, 0, 0, "+00:00"), break_length: 30)
Shift.create!(user_id: 2, start: Time.new(2021, 5, 3, 9, 0, 0, "+00:00"), finish: Time.new(2021, 5, 3, 13, 0, 0, "+00:00"), break_length: 15)
Shift.create!(user_id: 2, start: Time.new(2021, 5, 4, 9, 0, 0, "+00:00"), finish: Time.new(2021, 5, 4, 17, 0, 0, "+00:00"), break_length: 30)
Shift.create!(user_id: 3, start: Time.new(2021, 12, 22, 9, 0, 0, "+00:00"), finish: Time.new(2021, 12, 22, 17, 15, 0, "+00:00"), break_length: 45)
Shift.create!(user_id: 4, start: Time.new(2021, 1, 30, 9, 0, 0, "+00:00"), finish: Time.new(2021, 1, 30, 13, 15, 0, "+00:00"), break_length: 15)
