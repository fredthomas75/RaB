# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or create!d alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create!([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create!(name: 'Luke', movie: movies.first)

# delete_all
puts "Deleting all existing content"
Boat.delete_all
BrandModel.delete_all
User.delete_all

puts "Creating brands and models"
brands = ["Yamaha - SX190", "Yamaha - 242 F series", "Carver - 370 Manager", "Carver - 380 Santego", "Scanner - 590 RIB", "Rinker - 230 Atlantic"]
BrandModel.create!(name: brands[0])
BrandModel.create!(name: brands[1])
BrandModel.create!(name: brands[2])
BrandModel.create!(name: brands[3])
BrandModel.create!(name: brands[4])
BrandModel.create!(name: brands[5])

puts "Creating categories and other arrays"
category = ["Power", "Sail", "Unpowered", "Pirate"]
capacity = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
year = [2010, 2011, 2012, 2013, 2014]
equipment = ["gps", "lifejacket"]

puts "Creating 5 users"
5.times { User.create!(email: Faker::Internet.email, password: Faker::Internet.password )}

puts "Creating 10 boats"
10.times { Boat.create!(
  name: Faker::Restaurant.name,
  location: Faker::Address.full_address,
  description: Faker::Lorem.paragraph,
  category: category.sample,
  capacity: capacity.sample,
  year: year.sample,
  num_of_cabin: [1, 2, 3].sample,
  equipement: equipment.sample,
  user: User.all.sample,
  brand_model: BrandModel.all.sample,
  remote_photo_url: 'https://source.unsplash.com/random/?boat'
  ) }

puts "Thank you for your patience!"
