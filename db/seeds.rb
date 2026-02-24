puts "Cleaning database..."

Log.destroy_all
Message.destroy_all
Chat.destroy_all
Clinic.destroy_all
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
  attr1: "Food",
  attr2: "Vomit",
  attr3: "Toilet"
)

raye_url = "https://res.cloudinary.com/rts1307/image/upload/v1771651747/development/44856863-8493-4139-9498-22b38045ad1f_1.jpg"
raye.photo.attach(io: URI.open(raye_url), filename: "raye.png", content_type: "image/png")
raye.save!

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
  attr2: "Vomit",
  attr3: "Toilet"
)

percy_url = "https://res.cloudinary.com/rts1307/image/upload/v1771651750/development/4cdbca27-d28f-4a0f-938b-d543347b384e_1.jpg"
percy.photo.attach(io: URI.open(percy_url), filename: "percy.png", content_type: "image/png")
percy.save!

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
  attr2: "Toilet"
)

cory_url = "https://res.cloudinary.com/rts1307/image/upload/v1771651745/development/fa4678a3-74b6-470c-ab7d-adecf92b4dcf_1.jpg"
cory.photo.attach(io: URI.open(cory_url), filename: "cory.png", content_type: "image/png")
cory.save!

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
)

maple_url = "https://res.cloudinary.com/rts1307/image/upload/v1771497608/development/3qil42klx2nl1isfom3yeg90g3n4.png"
maple.photo.attach(io: URI.open(maple_url), filename: "maple.png", content_type: "image/png")
maple.save!

gabby = Pet.create!(
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

gabby_url = "https://res.cloudinary.com/rts1307/image/upload/v1771583181/development/gyla6lp4g4disamp18okxmgpwb4k.jpg"
gabby.photo.attach(io: URI.open(gabby_url), filename: "gabby.png", content_type: "image/png")
gabby.save!

jade = Pet.create!(
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

jade_url = "https://res.cloudinary.com/rts1307/image/upload/v1771584198/development/tqpjatpdi3kvgg2tmr8xad1eav71.jpg"
jade.photo.attach(io: URI.open(jade_url), filename: "jade.png", content_type: "image/png")
jade.save!

puts "Making clinics"

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

puts "Finished making clinics"

puts "Creating logs for Raye"

Log.create!(pet: raye,
  attr1: "Food", attr1_value: "3", attr1_memo: "50g",
  attr2: "Vomit", attr2_value: "", attr2_memo: "Threw up in the cat room!",
  attr3: "Toilet", attr3_value: "", attr3_memo: "Poop in the morning",
  date: Date.parse("2026-02-10"))

Log.create!(pet: raye,
  attr1: "Food", attr1_value: "4", attr1_memo: "45g",
  attr2: "Vomit", attr2_value: "0", attr2_memo: "",
  attr3: "Toilet", attr3_value: "", attr3_memo: "Poop in the morning!",
  date: Date.parse("2026-02-20"))

Log.create!(pet: raye,
  attr1: "Food", attr1_value: "3", attr1_memo: "45g",
  attr2: "Vomit", attr2_value: "0", attr2_memo: "Threw up in the cat room again!",
  attr3: "Toilet", attr3_value: "", attr3_memo: "Poop in the morning!",
  date: Date.yesterday)

Log.create!(pet: maple,
  attr1: "Food", attr1_value: "3", attr1_memo: "45g",
  attr2: "Vomit", attr2_value: "0", attr2_memo: "",
  attr3: "Toilet", attr3_value: "", attr3_memo: "Poop in the morning!",
  date: Date.parse("2026-02-23"))

puts "Created #{Log.count} logs"


puts "Finished! Created #{User.count} users and #{Pet.count} pets."

puts "Creating chats..."

chat1 = Chat.create!(
  owner: katie,
  vet: vet01,
  pet: raye
)

chat2 = Chat.create!(
  owner: renato,
  vet: vet01,
  pet: maple
)

chat3 = Chat.create!(
  owner: katie,
  vet: vet01,
  pet: percy
)

puts "Creating messages..."

# Chat 1 conversation
Message.create!(chat: chat1, user: katie, contents: "Hello Doctor, Raye has been coughing.")
Message.create!(chat: chat1, user: vet01, contents: "How long has this been happening?")
Message.create!(chat: chat1, user: katie, contents: "About two days.")
Message.create!(chat: chat1, user: vet01, contents: "Any changes in appetite?")
Message.create!(chat: chat1, user: katie, contents: "No, appetite is normal.")
Message.create!(chat: chat1, user: vet01, contents: "Please bring Raye in tomorrow at 10am.")

# Chat 2 conversation
Message.create!(chat: chat2, user: renato, contents: "Hi Doctor, Maple is not eating much.")
Message.create!(chat: chat2, user: vet01, contents: "Has she been vomiting?")
Message.create!(chat: chat2, user: renato, contents: "No vomiting, just low appetite.")
Message.create!(chat: chat2, user: vet01, contents: "Let's schedule a checkup this week.")
Message.create!(chat: chat2, user: renato, contents: "Thank you, that would be great.")

# Chat 4 conversation
Message.create!(chat: chat3, user: katie, contents: "Percy hasn't been going toilet very often")
Message.create!(chat: chat3, user: vet01, contents: "That's concerning. Any other symptoms?")
Message.create!(chat: chat3, user: katie, contents: "His appetite is a little low.")
Message.create!(chat: chat3, user: vet01, contents: "Alright, let's make an appointment for tomorrow. How is 3pm?")
Message.create!(chat: chat3, user: katie, contents: "Perfect. Thank you.")

puts "Finished! Created #{User.count} users, #{Pet.count} pets, #{Clinic.count} clinics, #{Log.count} logs, and #{Chat.count} chats with #{Message.count} messages."
