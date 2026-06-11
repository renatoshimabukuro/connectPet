puts "Creating pets..."

katie = User.find_by!(email: "katie@owner.com")
cat = Species.find_by!(name: "cat")
mixed = Breed.find_by!(
  name: "Mixed",
  species: cat
)

raye = Pet.find_or_initialize_by(
  user: katie,
  name: "Raye"
).tap do |pet|
  pet.dob         = Date.new(2021, 8, 12)
  pet.species     = cat
  pet.breed       = mixed
  pet.weight      = 4.8
  pet.fixed       = true
  pet.gender      = "Male"
  pet.microchip   = "111 111 111 111 111"

  pet.save!
end

raye.pet_vaccs.find_or_initialize_by(
  vaccine_definition: VaccineDefinition.find_by!(
    name: "3-way Combination Vaccine (FVRCP)",
    species: raye.species
  ),
  administered_on: Date.new(2025, 8, 12),
  expires_on: Date.new(2026, 8, 12)
)

# cloudinary
raye_url = "https://res.cloudinary.com/rts1307/image/upload/v1771651747/development/reye.jpg"
raye.photo.attach(io: URI.open(raye_url), filename: "raye.jpg", content_type: "image/jpg")
raye.onboarding_completed = true
raye.save!
puts "Raye created"

percy = Pet.find_or_initialize_by(
  user: katie,
  name: "Percy"
).tap do |pet|
  pet.dob         = Date.new(2021, 8, 12)
  pet.species     = cat
  pet.breed       = mixed
  pet.weight      = 5
  pet.fixed       = true
  pet.gender      = "Male"
  pet.microchip   = "111 111 111 111 112"

  pet.save!
end

percy.pet_vaccs.find_or_initialize_by(
  vaccine_definition: VaccineDefinition.find_by!(
    name: "3-way Combination Vaccine (FVRCP)",
    species: percy.species
  ),
  administered_on: Date.new(2025, 8, 12),
  expires_on: Date.new(2026, 8, 12)
)

# cloudinary
percy_url = "https://res.cloudinary.com/rts1307/image/upload/v1771651750/development/percy.jpg"
percy.photo.attach(io: URI.open(percy_url), filename: "percy.jpg", content_type: "image/jpg")
percy.onboarding_completed = true
percy.save!
puts "Percy created"

cory = Pet.find_or_initialize_by(
  user: katie,
  name: "Cory"
).tap do |pet|
  pet.dob         = Date.new(2024, 10, 22)
  pet.species     = cat
  pet.breed       = mixed
  pet.weight      = 5.2
  pet.fixed       = true
  pet.gender      = "Male"
  pet.microchip   = "111 111 111 111 113"

  pet.save!
end

cory.pet_vaccs.find_or_initialize_by(
  vaccine_definition: VaccineDefinition.find_by!(
    name: "3-way Combination Vaccine (FVRCP)",
    species: cory.species
  ),
  administered_on: Date.new(2025, 8, 12),
  expires_on: Date.new(2026, 8, 12)
)

# cloudinary
cory_url = "https://res.cloudinary.com/rts1307/image/upload/v1771651745/development/corey.jpg"
cory.photo.attach(io: URI.open(cory_url), filename: "cory.jpg", content_type: "image/jpg")
cory.onboarding_completed = true
cory.save!
puts "Cory created"

puts "----------------------"

renato = User.find_by!(email: "renato@owner.com")
dog = Species.find_by!(name: "dog")
toy = Breed.find_by!(
  name: "Toy Poodle",
  species: dog
)

maple = Pet.find_or_initialize_by(
  user: renato,
  name: "Maple"
).tap do |pet|
  pet.dob         = Date.new(2025, 4, 30)
  pet.species     = dog
  pet.breed       = toy
  pet.weight      = 4.5
  pet.fixed       = false
  pet.gender      = "Female"

  pet.save!
end

# cloudinary
maple_url = "https://res.cloudinary.com/rts1307/image/upload/v1771497608/development/maple.png"
maple.photo.attach(io: URI.open(maple_url), filename: "maple.png", content_type: "image/png")
maple.onboarding_completed = true
maple.save!
puts "Maple created"

puts "---------------------------"

troy = User.find_by!(email: "troy@owner.com")
exotic = Breed.find_by!(
  name: "Exotic shorthair",
  species: cat
)

gabby = Pet.find_or_initialize_by(
  user: troy,
  name: "Gabby"
).tap do |pet|
  pet.dob         = Date.new(2016, 5, 31)
  pet.species     = cat
  pet.breed       = exotic
  pet.weight      = 5
  pet.fixed       = true
  pet.gender      = "Male"

  pet.save!
end

# cloudinary
gabby_url = "https://res.cloudinary.com/rts1307/image/upload/v1771659086/development/gabby.jpg"
gabby.photo.attach(io: URI.open(gabby_url), filename: "gabby.jpg", content_type: "image/jpg")
gabby.onboarding_completed = true
gabby.save!
puts "Gabby created"

jade = Pet.find_or_initialize_by(
  user: troy,
  name: "Jade"
).tap do |pet|
  pet.dob         = Date.new(2020, 4, 5)
  pet.species     = cat
  pet.breed       = exotic
  pet.weight      = 4
  pet.fixed       = true
  pet.gender      = "Female"

  pet.save!
end

# cloudinary
jade_url = "https://res.cloudinary.com/rts1307/image/upload/v1771659087/development/jade.jpg"
jade.photo.attach(io: URI.open(jade_url), filename: "jade.jpg", content_type: "image/jpg")
jade.onboarding_completed = true
jade.save!
puts "Jade created"
