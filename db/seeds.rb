require 'open-uri'

ActionCable.server.config.cable = { "adapter" => "test" }
puts "Cleaning database..."

# Wipes all data from the tables, resets auto-incrementing IDs, and bypasses foreign key constraints.
# Instead of asking Rails to destroy objects one by one, send a command directly to the database engine.
# connection = ActiveRecord::Base.connection
# TRUNCATE: Removes all records from a table without processing each one individually(fast).
# RESTART IDENTITY: Clears all data, resets IDs to 1.
# CASCADE: Ignores link errors between tables.
# connection.execute("TRUNCATE messages, logs, friendships, chats, pets, clinics, users RESTART IDENTITY CASCADE")
Message.destroy_all
Log.destroy_all
Friendship.destroy_all
# remove all the unscopes chats
Chat.unscoped.destroy_all
#delete the register in db and the file in cloudinary
Clinic.all.each { |clinic| clinic.photo.purge }
Pet.all.each { |pet| pet.photo.purge }
Clinic.destroy_all
Pet.destroy_all
User.destroy_all

puts "Database cleaned! Creating new data..."

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
  address: "123-4567 Ehime, Matsuyama 1-2-3",
  role: "vet"
)

vet02 = User.create!(
  name: "James Hetfield",
  email: "james@vet.com",
  password: "password123",
  address: "456-7890 Ehime, Tobe 1-2-3",
  role: "vet"
)

vet03 = User.create!(
  name: "John Sykes",
  email: "john@vet.com",
  password: "password123",
  address: "234-5678 Ehime, Toon, Kanai 1-2-3",
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
  attr1: "Food",
  attr2: "Nausea",
  attr3: "Toilet",
  microchip: "111 111 111 111 111"
)

# cloudinary
raye_url = "https://res.cloudinary.com/rts1307/image/upload/v1771651747/development/reye.jpg"
raye.photo.attach(io: URI.open(raye_url), filename: "raye.jpg", content_type: "image/jpg")
raye.save!
puts "Raye created"

percy = Pet.create!(
  user: katie,
  name: "Percy",
  dob: Date.new(2021, 8, 12),
  species: "Cat",
  breed: "Mixed orange",
  weight: 5,
  vacc_status: "Vaccinated",
  fixed: true,
  gender: "Male",
  attr1: "Food",
  attr2: "Nausea",
  attr3: "Toilet",
  microchip: "111 111 111 111 112"
)

# cloudinary
percy_url = "https://res.cloudinary.com/rts1307/image/upload/v1771651750/development/percy.jpg"
percy.photo.attach(io: URI.open(percy_url), filename: "percy.jpg", content_type: "image/jpg")
percy.save!
puts "Percy created"

cory = Pet.create!(
  user: katie,
  name: "Cory",
  dob: Date.new(2024, 10, 22),
  species: "Cat",
  breed: "Mixed black",
  weight: 5.2,
  vacc_status: "Vaccinated",
  fixed: true,
  gender: "Male",
  attr1: "Food",
  attr2: "Toilet",
  microchip: "111 111 111 111 113"
)

# cloudinary
cory_url = "https://res.cloudinary.com/rts1307/image/upload/v1771651745/development/corey.jpg"
cory.photo.attach(io: URI.open(cory_url), filename: "cory.jpg", content_type: "image/jpg")
cory.save!
puts "Cory created"

maple = Pet.create!(
  user: renato,
  name: "Maple",
  dob: Date.new(2025, 4, 30),
  species: "Dog",
  breed: "Toy poodle",
  weight: 4.5,
  vacc_status: "Vaccinated",
  fixed: false,
  gender: "Female",
  attr1: "Food",
  attr2: "Nausea",
  attr3: "Toilet"
)

# cloudinary
maple_url = "https://res.cloudinary.com/rts1307/image/upload/v1771497608/development/maple.png"
maple.photo.attach(io: URI.open(maple_url), filename: "maple.png", content_type: "image/png")
maple.save!
puts "Maple created"

gabby = Pet.create!(
  user: troy,
  name: "Gabby",
  dob: Date.new(2016, 5, 31),
  species: "Cat",
  breed: "Exotic shorthair",
  weight: 5,
  vacc_status: "Vaccinated",
  fixed: true,
  gender: "Male"
)

# cloudinary
gabby_url = "https://res.cloudinary.com/rts1307/image/upload/v1771659086/development/gabby.jpg"
gabby.photo.attach(io: URI.open(gabby_url), filename: "gabby.jpg", content_type: "image/jpg")
gabby.save!
puts "Gabby created"

jade = Pet.create!(
  user: troy,
  name: "Jade",
  dob: Date.new(2020, 4, 5),
  species: "Cat",
  breed: "Exotic shorthair",
  weight: 4,
  vacc_status: "Vaccinated",
  fixed: true,
  gender: "Female"
)

# cloudinary
jade_url = "https://res.cloudinary.com/rts1307/image/upload/v1771659087/development/jade.jpg"
jade.photo.attach(io: URI.open(jade_url), filename: "jade.jpg", content_type: "image/jpg")
jade.save!
puts "Jade created"

puts "Making clinics"

lewagon = Clinic.create!(
  field: ["general practice", "cardiology", "gastroenterology"],
  clinic_name:"Le Wagon Pet Clinic",
  contact: "contact@lewagonvet.com",
  species: ["cats", "dogs", "monkeys"],
  languages: ["日本語", "Português"],
  user: vet01
  )

# cloudinary.
lewagon_url = "https://res.cloudinary.com/rts1307/image/upload/v1772465817/original/LewagonPetClinic.png"
lewagon.photo.attach(io: URI.open(lewagon_url), filename: "lewagon.png", content_type: "image/png")
lewagon.save!
puts "Le Wagon Clinic created"

sos_pet = Clinic.create!(
  field: ["general practice"],
  clinic_name:"SOS Pet",
  contact: "contact@sospet.com",
  species: ["cats", "dogs", "birds"],
  languages: ["English", "日本語"],
  user: vet02
  )

# cloudinary
sos_pet_url = "https://res.cloudinary.com/rts1307/image/upload/v1772465817/original/SOSpet.png"
sos_pet.photo.attach(io: URI.open(sos_pet_url), filename: "sos_pet.png", content_type: "image/png")
sos_pet.save!
puts "SOS Pet Clinic created"

pet_protect = Clinic.create!(
  field: ["oncology"],
  clinic_name:"PetProtect",
  contact: "contact@petprotect.com",
  species: ["cats", "dogs", "squirrels"],
  languages: ["日本語"],
  user: vet03
  )

# cloudinary
pet_protect_url = "https://res.cloudinary.com/rts1307/image/upload/v1772465818/original/PetProtect.png"
pet_protect.photo.attach(io: URI.open(pet_protect_url), filename: "pet_protect.png", content_type: "image/png")
pet_protect.save!
puts "Pet Protect Clinic created"

puts "Finished making clinics"

puts "Creating logs for Raye"

Log.create!(pet: raye,
  attr1: "Food", attr1_value: "5", attr1_memo: "50g",
  attr2: "Nausea", attr2_value: "1", attr2_memo: "Threw up in the cat room",
  attr3: "Toilet", attr3_value: "5", attr3_memo: "Poop in the morning",
  date: Date.parse("2026-02-26"))

Log.create!(pet: raye,
  attr1: "Food", attr1_value: "4", attr1_memo: "45g",
  attr2: "Nausea", attr2_value: "2", attr2_memo: "",
  attr3: "Toilet", attr3_value: "5", attr3_memo: "",
  date: Date.parse("2026-02-27"))

Log.create!(pet: raye,
  attr1: "Food", attr1_value: "3", attr1_memo: "45g",
  attr2: "Nausea", attr2_value: "1", attr2_memo: "Threw up in the cat room",
  attr3: "Toilet", attr3_value: "2", attr3_memo: "No poop",
  date: Date.parse("2026-02-28"))

Log.create!(pet: raye,
  attr1: "Food", attr1_value: "5", attr1_memo: "50g",
  attr2: "Nausea", attr2_value: "3", attr2_memo: "",
  attr3: "Toilet", attr3_value: "4", attr3_memo: "Small poop",
  date: Date.parse("2026-03-01"))

Log.create!(pet: raye,
  attr1: "Food", attr1_value: "3", attr1_memo: "35g",
  attr2: "Nausea", attr2_value: "4", attr2_memo: "Hacking, no vomit",
  attr3: "Toilet", attr3_value: "4", attr3_memo: "",
  date: Date.parse("2026-03-02"))

Log.create!(pet: raye,
  attr1: "Food", attr1_value: "4", attr1_memo: "40g",
  attr2: "Nausea", attr2_value: "3", attr2_memo: "",
  attr3: "Toilet", attr3_value: "5", attr3_memo: "",
  date: Date.parse("2026-03-03"))

Log.create!(pet: raye,
  attr1: "Food", attr1_value: "4", attr1_memo: "40g",
  attr2: "Nausea", attr2_value: "1", attr2_memo: "Threw up after breakfast",
  attr3: "Toilet", attr3_value: "3", attr3_memo: "No poop",
  date: Date.parse("2026-03-04"))

Log.create!(pet: raye,
  attr1: "Food", attr1_value: "5", attr1_memo: "50g",
  attr2: "Nausea", attr2_value: "2", attr2_memo: "",
  attr3: "Toilet", attr3_value: "5", attr3_memo: "",
  date: Date.parse("2026-03-05"))

Log.create!(pet: raye,
  attr1: "Food", attr1_value: "5", attr1_memo: "55g",
  attr2: "Nausea", attr2_value: "3", attr2_memo: "",
  attr3: "Toilet", attr3_value: "5", attr3_memo: "Healthy poop",
  date: Date.parse("2026-03-06"))

Log.create!(pet: raye,
  attr1: "Food", attr1_value: "4", attr1_memo: "35g",
  attr2: "Nausea", attr2_value: "3", attr2_memo: "Hacking, no vomit",
  attr3: "Toilet", attr3_value: "3", attr3_memo: "Small poop",
  date: Date.parse("2026-03-07"))

Log.create!(pet: raye,
  attr1: "Food", attr1_value: "4", attr1_memo: "45g",
  attr2: "Nausea", attr2_value: "5", attr2_memo: "",
  attr3: "Toilet", attr3_value: "4", attr3_memo: "",
  date: Date.parse("2026-03-08"))

Log.create!(pet: raye,
  attr1: "Food", attr1_value: "4", attr1_memo: "40g",
  attr2: "Nausea", attr2_value: "2", attr2_memo: "Small vomit in the morning",
  attr3: "Toilet", attr3_value: "3", attr3_memo: "",
  date: Date.parse("2026-03-09"))

Log.create!(pet: raye,
  attr1: "Food", attr1_value: "5", attr1_memo: "60g",
  attr2: "Nausea", attr2_value: "5", attr2_memo: "",
  attr3: "Toilet", attr3_value: "5", attr3_memo: "",
  date: Date.parse("2026-03-11"))

Log.create!(pet: raye,
  attr1: "Food", attr1_value: "5", attr1_memo: "50g",
  attr2: "Nausea", attr2_value: "5", attr2_memo: "",
  attr3: "Toilet", attr3_value: "5", attr3_memo: "",
  date: Date.parse("2026-03-12"))

Log.create!(pet: maple,
  attr1: "Food", attr1_value: "4", attr1_memo: "45g",
  attr2: "Nausea", attr2_value: "5", attr2_memo: "",
  attr3: "Toilet", attr3_value: "", attr3_memo: "Poop in the morning!",
  date: Date.parse("2026-02-23"))

Log.create!(pet: cory,
  attr1: "Food", attr1_value: "5", attr1_memo: "",
  attr2: "Toilet", attr2_value: "5", attr2_memo: "",
  date: Date.parse("2026-02-23")
  )

Log.create!(pet: cory,
  attr1: "Food", attr1_value: "5", attr1_memo: "",
  attr2: "Toilet", attr2_value: "4", attr2_memo: "",
  date: Date.parse("2026-02-24")
  )

puts "Created #{Log.count} logs"

puts "Finished! Created #{User.count} users and #{Pet.count} pets."

puts "Creating chats..."

chat1 = Chat.create!(
  owner: katie,
  vet: vet02,
  pet: raye,
  archived: false,
  created_at: Date.parse("2026-02-24"),
  updated_at: Date.parse("2026-02-24")
)

chat2 = Chat.create!(
  owner: renato,
  vet: vet01,
  pet: maple,
  archived: false
)

chat3 = Chat.create!(
  owner: katie,
  vet: vet02,
  pet: percy,
  archived: false,
  created_at: Date.parse("2026-01-30"),
  updated_at: Date.parse("2026-01-30")
)

puts "Creating friendships"

Friendship.create!(
  owner: katie,
  vet: vet02,
  pet: raye,
  accepted: true
)

Friendship.create!(
  owner: renato,
  vet: vet01,
  pet: maple,
  accepted: true
)

Friendship.create!(
  owner: katie,
  vet: vet02,
  pet: percy,
  accepted: true
)

puts "Creating messages..."

# Chat 1 conversation
Message.create!(chat: chat1, user: katie, contents: "Hello Doctor, Raye has been heaving.", created_at: Time.zone.parse('2026-02-24 10:00:00'), updated_at: Time.zone.parse('2026-02-24 10:00:00'))
Message.create!(chat: chat1, user: vet02, contents: "How long has this been happening?", created_at: Time.zone.parse('2026-02-24 10:05:00'), updated_at: Time.zone.parse('2026-02-24 10:05:00'))
Message.create!(chat: chat1, user: katie, contents: "About two days.", created_at: Time.zone.parse('2026-02-24 10:15:00'), updated_at: Time.zone.parse('2026-02-24 10:15:00'))
Message.create!(chat: chat1, user: vet02, contents: "Any changes in appetite?", created_at: Time.zone.parse('2026-02-24 10:20:00'), updated_at: Time.zone.parse('2026-02-24 10:20:00'))
Message.create!(chat: chat1, user: katie, contents: "No, appetite is normal.", created_at: Time.zone.parse('2026-02-24 10:30:00'), updated_at: Time.zone.parse('2026-02-24 10:30:00'))
Message.create!(chat: chat1, user: vet02, contents: "Please bring Raye in tomorrow at 10am.", created_at: Time.zone.parse('2026-02-24 10:45:00'), updated_at: Time.zone.parse('2026-02-24 10:45:00'))

# Chat 2 conversation
Message.create!(chat: chat2, user: renato, contents: "Hi Doctor, Maple is not eating much.")
Message.create!(chat: chat2, user: vet01, contents: "Has she been vomiting?")
Message.create!(chat: chat2, user: renato, contents: "No vomiting, just low appetite.")
Message.create!(chat: chat2, user: vet01, contents: "Let's schedule a checkup this week.")
Message.create!(chat: chat2, user: renato, contents: "Thank you, that would be great.")

# Chat 4 conversation
Message.create!(chat: chat3, user: katie, contents: "Percy hasn't been going toilet very often", created_at: Time.zone.parse('2026-01-30 10:00:00'), updated_at: Time.zone.parse('2026-01-30 10:00:00'))
Message.create!(chat: chat3, user: vet02, contents: "That's concerning. Any other symptoms?", created_at: Time.zone.parse('2026-01-30 10:10:00'), updated_at: Time.zone.parse('2026-01-30 10:10:00'))
Message.create!(chat: chat3, user: katie, contents: "His appetite is a little low.", created_at: Time.zone.parse('2026-01-30 11:00:00'), updated_at: Time.zone.parse('2026-01-30 11:00:00'))
Message.create!(chat: chat3, user: vet02, contents: "Alright, let's make an appointment for tomorrow. How is 3pm?" , created_at: Time.zone.parse('2026-01-30 11:10:00'), updated_at: Time.zone.parse('2026-01-30 11:10:00'))
Message.create!(chat: chat3, user: katie, contents: "Perfect. Thank you.", created_at: Time.zone.parse('2026-01-30 11:15:00'), updated_at: Time.zone.parse('2026-01-30 11:15:00'))

puts "Finished! Created #{User.count} users, #{Pet.count} pets, #{Clinic.count} clinics, #{Log.count} logs, and #{Chat.count} chats with #{Message.count} messages."
