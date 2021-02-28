# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

# generate 20 owners
(2..21).each do |id|
    Owner.create!(
# each user is assigned an id from 1-20
        id: id, 
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        telephone: Faker::PhoneNumber.phone_number,
        email: Faker::Internet.email,
        address_1: Faker::Address.street_address,
        address_2: Faker::Address.secondary_address,
        town: Faker::Address.city,
        postcode: Faker::Address.postcode
    )
end
