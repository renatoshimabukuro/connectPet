# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Clinic.destroy_all
User.destroy_all

user = User.create!(name: "renato", email: "renato@test.com", password: "123456", role: "vet", address: "test address")
clinic = Clinic.create!(field: "cardiology", clinic_name:"Pet Forest", contact: "test", species: ["cats", "dogs", "horses"], user: user)

user2 = User.create!(name: "troy", email: "troy@test.com", password: "123456", role: "owner", address: "test address")
clinic2 = Clinic.create!(field: "cardiology", clinic_name:"My pet", contact: "test", species: ["cats", "dogs"], user: user)

user3 = User.create!(name: "katie", email: "katie@test.com", password: "123456", role: "vet", address: "test address")
clinic3 = Clinic.create!(field: "cardiology", clinic_name:"Pet Shop Boys", contact: "test", species: ["cats", "dogs", "birds"], user: user)
