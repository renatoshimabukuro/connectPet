puts "Cleaning database..."

Message.destroy_all
Chat.destroy_all
Pet.destroy_all
User.destroy_all

puts "Creating users..."

owner1 = User.create!(
  email: "owner1@test.com",
  password: "password123",
  password_confirmation: "password123",
  role: "owner",
  name: "Alice Tanaka",
  address: "Tokyo"
)

owner2 = User.create!(
  email: "owner2@test.com",
  password: "password123",
  password_confirmation: "password123",
  role: "owner",
  name: "Ken Suzuki",
  address: "Osaka"
)

vet1 = User.create!(
  email: "vet1@test.com",
  password: "password123",
  password_confirmation: "password123",
  role: "vet",
  name: "Dr. Sato",
  address: "Yokohama"
)

vet2 = User.create!(
  email: "vet2@test.com",
  password: "password123",
  password_confirmation: "password123",
  role: "vet",
  name: "Dr. Williams",
  address: "Nagoya"
)

puts "Creating pets..."

pet1 = Pet.create!(
  user: owner1,
  name: "Mochi",
  dob: Date.new(2022, 5, 10),
  species: "Dog",
  breed: "Shiba Inu",
  microchip: "MC001",
  weight: 8.5,
  current_meds: "None",
  vacc_status: "Up to date",
  notes: "Very energetic"
)

pet2 = Pet.create!(
  user: owner2,
  name: "Luna",
  dob: Date.new(2021, 3, 3),
  species: "Cat",
  breed: "Scottish Fold",
  microchip: "MC002",
  weight: 4.2,
  current_meds: "Vitamin supplements",
  vacc_status: "Up to date",
  notes: "Shy but friendly"
)

puts "Creating chats..."

chat1 = Chat.create!(
  owner: owner1,
  vet: vet1,
  pet: pet1
)

chat2 = Chat.create!(
  owner: owner2,
  vet: vet2,
  pet: pet2
)

puts "Creating messages..."

# Chat 1 conversation
Message.create!(chat: chat1, user: owner1, contents: "Hello Doctor, Mochi has been coughing.")
Message.create!(chat: chat1, user: vet1, contents: "How long has this been happening?")
Message.create!(chat: chat1, user: owner1, contents: "About two days.")
Message.create!(chat: chat1, user: vet1, contents: "Any changes in appetite?")
Message.create!(chat: chat1, user: owner1, contents: "No, appetite is normal.")
Message.create!(chat: chat1, user: vet1, contents: "Please bring Mochi in tomorrow at 10am.")

# Chat 2 conversation
Message.create!(chat: chat2, user: owner2, contents: "Hi Doctor, Luna is not eating much.")
Message.create!(chat: chat2, user: vet2, contents: "Has she been vomiting?")
Message.create!(chat: chat2, user: owner2, contents: "No vomiting, just low appetite.")
Message.create!(chat: chat2, user: vet2, contents: "Let's schedule a checkup this week.")
Message.create!(chat: chat2, user: owner2, contents: "Thank you, that would be great.")

puts "Seeding complete!"
puts "Created:"
puts "- 4 Users"
puts "- 2 Pets"
puts "- 2 Chats"
puts "- #{Message.count} Messages"
