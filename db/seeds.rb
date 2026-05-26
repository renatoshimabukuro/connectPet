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
LogValue.destroy_all
PetAttribute.destroy_all
AttributeDefinition.destroy_all

Message.destroy_all
Log.destroy_all
Friendship.destroy_all
# remove all the unscopes chats
Chat.unscoped.destroy_all


#delete the register in db and the file in cloudinary
Clinic.all.each { |clinic| clinic.photo.purge }
Pet.all.each { |pet| pet.photo.purge }

VaccineDefinition.destroy_all
PetVacc.destroy_all
Clinic.destroy_all
Pet.destroy_all
User.destroy_all

Breed.destroy_all
Species.destroy_all

puts "Database cleaned! Creating new data..."

puts "Creating species and breeds..."

dog = Species.find_or_create_by!(name: "dog", icon: "fa-solid fa-dog")
Breed.find_or_create_by!(name: "Labrador Retriever", species: dog)
Breed.find_or_create_by!(name: "Golden Retriever", species: dog)
Breed.find_or_create_by!(name: "Shiba Inu", species: dog)
toy = Breed.find_or_create_by!(name: "Toy Poodle", species: dog)
Breed.find_or_create_by!(name: "Miniature Dachshund", species: dog)
Breed.find_or_create_by!(name: "Chihuahua", species: dog)
Breed.find_or_create_by!(name: "French Bulldog", species: dog)
Breed.find_or_create_by!(name: "Beagle", species: dog)
Breed.find_or_create_by!(name: "Border Collie", species: dog)
Breed.find_or_create_by!(name: "Corgi", species: dog)
Breed.find_or_create_by!(name: "German Shepherd", species: dog)
Breed.find_or_create_by!(name: "Pomeranian", species: dog)
Breed.find_or_create_by!(name: "Maltese", species: dog)
Breed.find_or_create_by!(name: "Siberian Husky", species: dog)
Breed.find_or_create_by!(name: "Yorkshire Terrier", species: dog)

puts "Created dogs with #{dog.breeds.count} breeds."

cat = Species.find_or_create_by!(name: "cat", icon: "fa-solid fa-cat")
Breed.find_or_create_by!(name: "Domestic Shorthair", species: cat)
Breed.find_or_create_by!(name: "Scottish Fold", species: cat)
Breed.find_or_create_by!(name: "American Shorthair", species: cat)
Breed.find_or_create_by!(name: "Siamese", species: cat)
Breed.find_or_create_by!(name: "Maine Coon", species: cat)
Breed.find_or_create_by!(name: "Ragdoll", species: cat)
Breed.find_or_create_by!(name: "Persian", species: cat)
Breed.find_or_create_by!(name: "Bengal", species: cat)
Breed.find_or_create_by!(name: "Russian Blue", species: cat)
Breed.find_or_create_by!(name: "British Shorthair", species: cat)
Breed.find_or_create_by!(name: "Sphynx", species: cat)
Breed.find_or_create_by!(name: "Norwegian Forest Cat", species: cat)
mixed = Breed.find_or_create_by!(name: "Mixed", species: cat)
exotic = Breed.find_or_create_by!(name: "Exotic shorthair", species: cat)

puts "Created cats with #{cat.breeds.count} breeds."

rabbit = Species.find_or_create_by!(name: "rabbit", icon: "fa-solid fa-carrot")
Breed.find_or_create_by!(name: "Holland Lop", species: rabbit)
Breed.find_or_create_by!(name: "Netherland Dwarf", species: rabbit)
Breed.find_or_create_by!(name: "Lionhead", species: rabbit)
Breed.find_or_create_by!(name: "Mini Rex", species: rabbit)
Breed.find_or_create_by!(name: "Flemish Giant", species: rabbit)
Breed.find_or_create_by!(name: "English Lop", species: rabbit)
Breed.find_or_create_by!(name: "Dutch Rabbit", species: rabbit)

puts "Created rabbits with #{rabbit.breeds.count} breeds."

bird = Species.find_or_create_by!(name: "bird", icon: "fa-solid fa-crow")
Breed.find_or_create_by!(name: "Budgerigar", species: bird)
Breed.find_or_create_by!(name: "Cockatiel", species: bird)
Breed.find_or_create_by!(name: "Lovebird", species: bird)
Breed.find_or_create_by!(name: "Canary", species: bird)
Breed.find_or_create_by!(name: "Finch", species: bird)
Breed.find_or_create_by!(name: "African Grey Parrot", species: bird)
Breed.find_or_create_by!(name: "Conure", species: bird)
Breed.find_or_create_by!(name: "Macaw", species: bird)

puts "Created birds with #{bird.breeds.count} breeds."

hamster = Species.find_or_create_by!(name: "hamster", icon: "fa-solid fa-paw")
Breed.find_or_create_by!(name: "Syrian", species: hamster)
Breed.find_or_create_by!(name: "Dwarf Campbell", species: hamster)
Breed.find_or_create_by!(name: "Winter White", species: hamster)
Breed.find_or_create_by!(name: "Roborovski", species: hamster)
Breed.find_or_create_by!(name: "Chinese Hamster", species: hamster)

puts "Created hamsters with #{hamster.breeds.count} breeds."

guinea_pig = Species.find_or_create_by!(name: "guinea pig", icon: "fa-solid fa-paw")
Breed.find_or_create_by!(name: "American", species: guinea_pig)
Breed.find_or_create_by!(name: "Abyssinian", species: guinea_pig)
Breed.find_or_create_by!(name: "Peruvian", species: guinea_pig)
Breed.find_or_create_by!(name: "Teddy", species: guinea_pig)
Breed.find_or_create_by!(name: "Silkie", species: guinea_pig)

puts "Created guinea pigs with #{guinea_pig.breeds.count} breeds."

fish = Species.find_or_create_by!(name: "fish", icon: "fa-solid fa-fish")
Breed.find_or_create_by!(name: "Goldfish", species: fish)
Breed.find_or_create_by!(name: "Betta", species: fish)
Breed.find_or_create_by!(name: "Guppy", species: fish)
Breed.find_or_create_by!(name: "Neon Tetra", species: fish)
Breed.find_or_create_by!(name: "Angelfish", species: fish)
Breed.find_or_create_by!(name: "Molly", species: fish)
Breed.find_or_create_by!(name: "Platy", species: fish)
Breed.find_or_create_by!(name: "Corydoras", species: fish)

puts "Created fish with #{fish.breeds.count} breeds."

reptile = Species.find_or_create_by!(name: "reptile", icon: "fa-solid fa-dragon")
Breed.find_or_create_by!(name: "Leopard Gecko", species: reptile)
Breed.find_or_create_by!(name: "Crested Gecko", species: reptile)
Breed.find_or_create_by!(name: "Bearded Dragon", species: reptile)
Breed.find_or_create_by!(name: "Corn Snake", species: reptile)
Breed.find_or_create_by!(name: "Ball Python", species: reptile)
Breed.find_or_create_by!(name: "Red-Eared Slider", species: reptile)

puts "Created reptiles with #{reptile.breeds.count} breeds."

Species.find_or_create_by!(name: "horse", icon: "fa-solid fa-horse")

horse = Species.find_or_create_by!(name: "horse", icon: "fa-solid fa-horse")
Breed.find_or_create_by!(name: "Thoroughbred", species: horse)
Breed.find_or_create_by!(name: "Arabian", species: horse)
Breed.find_or_create_by!(name: "Quarter Horse", species: horse)
Breed.find_or_create_by!(name: "Appaloosa", species: horse)
Breed.find_or_create_by!(name: "Paint Horse", species: horse)
Breed.find_or_create_by!(name: "Morgan", species: horse)
Breed.find_or_create_by!(name: "Friesian", species: horse)
Breed.find_or_create_by!(name: "Shetland Pony", species: horse)
Breed.find_or_create_by!(name: "Clydesdale", species: horse)
Breed.find_or_create_by!(name: "Percheron", species: horse)
Breed.find_or_create_by!(name: "Warmblood", species: horse)
Breed.find_or_create_by!(name: "Miniature Horse", species: horse)
Breed.find_or_create_by!(name: "Mixed Breed", species: horse)

puts "Created horse with #{horse.breeds.count} breeds."


puts "-------------------------------------------------------------------------"




# Dog
#
VaccineDefinition.find_or_create_by!(name: "rabies", species: dog) do |vacc|
  vacc.default_duration_days = 365
end

VaccineDefinition.find_or_create_by!(name: "DHPP", species: dog) do |vacc|
  vacc.default_duration_days = 365
end

VaccineDefinition.find_or_create_by!(name: "Leptospirosis", species: dog ) do |vacc|
  vacc.default_duration_days = 365
end

VaccineDefinition.find_or_create_by!(name: "Bordetella", species: dog) do |vacc|
  vacc.default_duration_days = 365
end

VaccineDefinition.find_or_create_by!(name: "Canine Influenza", species: dog) do |vacc|
  vacc.default_duration_days = 365
end

# Cat

VaccineDefinition.find_or_create_by!(name: "3-way Combination Vaccine (FVRCP)", species: cat) do |vacc|
  vacc.default_duration_days = 365
end

VaccineDefinition.find_or_create_by!(name: "5-way Combination Vaccine", species: cat) do |vacc|
  vacc.default_duration_days = 365
end

VaccineDefinition.find_or_create_by!(name: "Rabies", species: cat) do |vacc|
  vacc.default_duration_days = 365
end

VaccineDefinition.find_or_create_by!(name: "FeLV", species: cat) do |vacc|
  vacc.default_duration_days = 365
end

# # Rabbit

# VaccineDefinition.find_or_create_by!(name: "Rabbit Hemorrhagic Disease (RHDV2)", species: rabbit) do |vacc|
#   vacc.default_duration_days = 365
# end

# # Bird

# VaccineDefinition.find_or_create_by!(name: "Polyomavirus", species: bird) do |vacc|
#   vacc.default_duration_days = 365
# end

# # Horse

# VaccineDefinition.find_or_create_by!(name: "Equine Influenza", species: horse) do |vacc|
#   vacc.default_duration_days = 365
# end

# VaccineDefinition.find_or_create_by!(name: "Tetanus", species: horse) do |vacc|
#   vacc.default_duration_days = 365
# end

# VaccineDefinition.find_or_create_by!(name: "Japanese Encephalitis", species: horse) do |vacc|
#   vacc.default_duration_days = 365
# end

puts "Creating users..."
katie = User.create!(
  first_name: "Katie",
  last_name: "Wood",
  email: "katie@owner.com",
  password: "password123",
  role: "owner",
  country: "JP",
  city: "Matsuyama"
)

renato = User.create!(
  first_name: "Renato",
  last_name: "Shimabukuro",
  email: "renato@owner.com",
  password: "password123",
  role: "owner",
  country: "JP",
  city: "Tokyo"
)

troy = User.create!(
  first_name: "Troy",
  last_name: "Zangara",
  email: "troy@owner.com",
  password: "password123",
  role: "owner",
  country: "JP",
  city: "Osaka"
)

vet01 = User.create!(
  first_name: "Patrick Gregory",
  last_name: "House",
  email: "patrick@vet.com",
  password: "password123",
  # address: "123-4567 Ehime, Matsuyama 1-2-3",
  role: "vet",
  country: "JP",
  city: "Matsuyama"
)

vet02 = User.create!(
  first_name: "James",
  last_name: "Hetfield",
  email: "james@vet.com",
  password: "password123",
  # address: "456-7890 Ehime, Tobe 1-2-3",
  role: "vet",
  country: "JP",
  city: "Matsuyama"
)

vet03 = User.create!(
  first_name: "John",
  last_name: "Sykes",
  email: "john@vet.com",
  password: "password123",
  # address: "234-5678 Ehime, Toon, Kanai 1-2-3",
  role: "vet",
  country: "JP",
  city: "Matsuyama"
)

puts "Creating pets..."
raye = Pet.create!(
  user: katie,
  name: "Raye",
  dob: Date.new(2021, 8, 12),
  species: cat,
  breed: mixed,
  weight: 4.8,
  fixed: true,
  gender: "Male",
  microchip: "111 111 111 111 111"
)

raye.pet_vaccs.create!(
  vaccine_definition: VaccineDefinition.find_by!(
    name: "3-way Combination Vaccine (FVRCP)",
    species: raye.species
  ),
  administered_on: Date.today,
  expires_on: Date.today + 365.days
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
  species: cat,
  breed: mixed,
  weight: 5,
  fixed: true,
  gender: "Male",
  microchip: "111 111 111 111 112"
)

percy.pet_vaccs.create!(
  vaccine_definition: VaccineDefinition.find_by!(
    name: "3-way Combination Vaccine (FVRCP)",
    species: percy.species
  ),
  administered_on: Date.today,
  expires_on: Date.today + 365.days
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
  species: cat,
  breed: mixed,
  weight: 5.2,
  fixed: true,
  gender: "Male",
  microchip: "111 111 111 111 113"
)

cory.pet_vaccs.create!(
  vaccine_definition: VaccineDefinition.find_by!(
    name: "3-way Combination Vaccine (FVRCP)",
    species: cory.species
  ),
  administered_on: Date.today,
  expires_on: Date.today + 365.days
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
  species: dog,
  breed: toy,
  weight: 4.5,
  fixed: false,
  gender: "Female"
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
  species: cat,
  breed: exotic,
  weight: 5,
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
  species: cat,
  breed: exotic,
  weight: 4,
  fixed: true,
  gender: "Female"
)

# cloudinary
jade_url = "https://res.cloudinary.com/rts1307/image/upload/v1771659087/development/jade.jpg"
jade.photo.attach(io: URI.open(jade_url), filename: "jade.jpg", content_type: "image/jpg")
jade.save!
puts "Jade created"

puts "Creating attribute definitions..."

appetite = AttributeDefinition.find_or_create_by!(
  name: "Appetite",
  value_type: :range,
  user: nil,
  icon: "mdi:silverware-fork-knife"
)

nausea = AttributeDefinition.find_or_create_by!(
  name: "Nausea",
  value_type: :boolean,
  user: nil,
  icon: "streamline:smiley-nauseas-remix"
)

toilet = AttributeDefinition.find_or_create_by!(
  name: "Toilet",
  value_type: :boolean,
  user: nil,
  icon: "mdi:toilet"
)

puts "Attribute definitions created"

puts "Assigning attributes to pets..."

def assign_attrs(pet, attrs)
  attrs.each do |attr|
    PetAttribute.find_or_create_by!(
      pet: pet,
      attribute_definition: attr
    )
  end
end

assign_attrs(raye, [appetite, nausea, toilet])
assign_attrs(percy, [appetite, nausea, toilet])
assign_attrs(cory, [appetite, toilet])
assign_attrs(maple, [appetite, nausea, toilet])

puts "Attributes assigned to Raye, Percy, Cory, and Maple"

puts "Adding log helper"

def create_logs_with_values(pet:, date:, values:)
  log = Log.create!(pet: pet, date: date)

  values.each do |attr_name, data|
    attr_def = AttributeDefinition.find_by!(name: attr_name)

    pet_attr = PetAttribute.find_by!(pet: pet, attribute_definition: attr_def)

    LogValue.create!(
      log: log,
      pet_attribute: pet_attr,
      range_value: attr_def.range? ? data[:value] : nil,
      boolean_value: attr_def.boolean? ? data[:value] : nil,
      memo: data[:memo]
    )
  end

  log
end

start_date = 1.week.ago.to_date

puts "Creating logs for pets..."

create_logs_with_values(
  pet: raye,
  date: start_date,
  values: {
    "Appetite" => { value: 5, memo: "50g" },
    "Nausea" => { value: true, memo: "Threw up in the cat room" },
    "Toilet" => { value: true, memo: "Poop in the morning" }
  }
)

create_logs_with_values(
  pet: raye,
  date: start_date + 1,
  values: {
    "Appetite" => { value: 4, memo: "45g" },
    "Nausea" => { value: false, memo: "" },
    "Toilet" => { value: true, memo: "" }
  }
)

create_logs_with_values(
  pet: raye,
  date: start_date + 2,
  values: {
    "Appetite" => { value: 3, memo: "40g" },
    "Nausea" => { value: true, memo: "Threw up in the cat room" },
    "Toilet" => { value: true, memo: "No poop" }
  }
)

create_logs_with_values(
  pet: raye,
  date: start_date + 3,
  values: {
    "Appetite" => { value: 5, memo: "50g" },
    "Nausea" => { value: false, memo: "" },
    "Toilet" => { value: true, memo: "Small poop" }
  }
)

create_logs_with_values(
  pet: raye,
  date: start_date + 4,
  values: {
    "Appetite" => { value: 3, memo: "35g" },
    "Nausea" => { value: true, memo: "Hacking, no vomit" },
    "Toilet" => { value: true, memo: "" }
  }
)

create_logs_with_values(
  pet: raye,
  date: start_date + 5,
  values: {
    "Appetite" => { value: 3, memo: "40g" },
    "Nausea" => { value: false, memo: "" },
    "Toilet" => { value: true, memo: "" }
  }
)

create_logs_with_values(
  pet: raye,
  date: start_date + 6,
  values: {
    "Appetite" => { value: 4, memo: "45g" },
    "Nausea" => { value: false, memo: "" },
    "Toilet" => { value: true, memo: "No poop" }
  }
)

create_logs_with_values(
  pet: cory,
  date: start_date + 6,
  values: {
    "Appetite" => { value: 5, memo: "50g" },
    "Toilet" => { value: true, memo: "" }
  }
)

create_logs_with_values(
  pet: maple,
  date: start_date + 6,
  values: {
    "Appetite" => { value: 4, memo: "45g"},
    "Nausea" => { value: false, memo: "" },
    "Toilet" => { value: true, memo: "Poop in the morning!" }
  }
)

puts "Created #{Log.count} logs"

puts "Making clinics..."

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
