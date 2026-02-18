# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "Cleaning database..."
Log.destroy_all
Message.destroy_all
Chat.destroy_all
Pet.destroy_all
User.destroy_all

puts "Creating users..."
katie = User.create!(
  name: "Katie",
  email: "katie@owner.com",
  password: "password123",
  role: "owner"
)

renato = User.create!(
  name: "Renato",
  email: "renato@owner.com",
  password: "password123",
  role: "owner"
)

troy = User.create!(
  name: "Troy",
  email: "troy@owner.com",
  password: "password123",
  role: "owner"
)

vet01 = User.create!(
  name: "Patrick Gregory House",
  email: "patrick@vet.com",
  password: "password123",
  address: "123-4567 Tokyo, Meguro Higashi-Meguro 1-2-3",
  role: "vet"
)

vet02 = User.create!(
  name: "James Hetfield",
  email: "james@vet.com",
  password: "password123",
  address: "456-7890 Tokyo Machida, Kanamori 1-2-3",
  role: "vet"
)

vet03 = User.create!(
  name: "John Sykes",
  email: "john@vet.com",
  password: "password123",
  address: "234-5678 Kanagawa Yokohama, Kanai 1-2-3",
  role: "vet"
)

puts "Creating pets..."
raye = Pet.create!(
  user: katie,
  name: "Raye",
  dob: Date.new(2021, 8, 12),
  species: "Cat",
  breed: "Mixed black",
  weight: 4.8,
  vacc_status: "Vaccinated",
  fixed: true,
  gender: "Male",
)

Pet.create!(
  user: katie,
  name: "Percy",
  dob: Date.new(2021, 8, 12),
  species: "Cat",
  breed: "Mixed orange",
  weight: 5,
  vacc_status: "Vaccinated",
  fixed: true,
  gender: "Male",
)

Pet.create!(
  user: katie,
  name: "Cory",
  dob: Date.new(2024, 10, 22),
  species: "Cat",
  breed: "Mixed black",
  weight: 5.2,
  vacc_status: "Vaccinated",
  fixed: true,
  gender: "Male",
)

Pet.create!(
  user: renato,
  name: "Maple",
  dob: Date.new(2025, 4, 30),
  species: "Dog",
  breed: "Toy poodle",
  weight: 4.5,
  vacc_status: "Vaccinated",
  fixed: false,
  gender: "Female",
)

Pet.create!(
  user: troy,
  name: "Gabby",
  dob: Date.new(2016, 5, 31),
  species: "Cat",
  breed: "Exotic shorthair",
  weight: 5,
  vacc_status: "Vaccinated",
  fixed: true,
  gender: "Male",
)

Pet.create!(
  user: troy,
  name: "Jade",
  dob: Date.new(2020, 4, 5),
  species: "Cat",
  breed: "Exotic shorthair",
  weight: 4,
  vacc_status: "Vaccinated",
  fixed: true,
  gender: "Female",
)

puts "Finished! Created #{User.count} users and #{Pet.count} pets."

puts "Creating logs for Raye"

Log.create!(pet: raye, health: "Food - 5", date: Date.today)
Log.create!(pet: raye, health: "Toilet - 5", date: Date.today)
Log.create!(pet: raye, health: "Vomiting", date: Date.today)

puts "Created #{Log.count} logs"
puts "Creating clinics..."

Clinic.create!(
  field: ["cardiology", "dentist"],
  clinic_name:"Pet Forest",
  contact: "contact@pet_forest.com",
  species: ["cats", "dogs", "horses"],
  user: vet01
  )

  Clinic.create!(
  field: ["Oncology","surgery"],
  clinic_name:"SOS Pet",
  contact: "contact@sospet.com",
  species: ["cats", "dogs", "birds"],
  user: vet02
  )

  Clinic.create!(
  field: ["Oncology"],
  clinic_name:"SOS Pet",
  contact: "contact@sospet.com",
  species: ["cats", "dogs", "birds"],
  user: vet03
  )

puts "Finished! Created #{User.count} users, #{Pet.count} pets and #{Clinic.count} clinics"
