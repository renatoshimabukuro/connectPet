puts "Making clinics..."

def attach_photo(record, url, filename)
  return if record.photo.attached?

  file = URI.open(url)
  record.photo.attach(
    io: file,
    filename: filename,
    content_type: "image/png"
  )
end

vet01 = User.find_by!(email: "patrick@vet.com")

lewagon = Clinic.find_or_initialize_by(clinic_name: "Le Wagon Pet Clinic").tap do |c|
  c.field = ["general practice", "cardiology", "gastroenterology"]
  c.contact = "contact@lewagonvet.com"
  c.species = ["cats", "dogs", "monkeys"]
  c.languages = ["日本語", "Português"]
  c.user = vet01
  c.save!
end

attach_photo(
  lewagon,
  "https://res.cloudinary.com/rts1307/image/upload/v1772465817/original/LewagonPetClinic.png",
  "lewagon.png"
)

puts "Le Wagon Clinic created"

vet02 = User.find_by!(email: "james@vet.com")

sos_pet = Clinic.find_or_initialize_by(clinic_name: "SOS Pet").tap do |c|
  c.field = ["general practice"]
  c.contact = "contact@sospet.com"
  c.species = ["cats", "dogs", "birds"]
  c.languages = ["English", "日本語"]
  c.user = vet02
  c.save!
end

attach_photo(
  sos_pet,
  "https://res.cloudinary.com/rts1307/image/upload/v1772465817/original/SOSpet.png",
  "sos_pet.png"
)

puts "SOS Pet Clinic created"

vet03 = User.find_by!(email: "john@vet.com")

pet_protect = Clinic.find_or_initialize_by(clinic_name: "PetProtect").tap do |c|
  c.field = ["oncology"]
  c.contact = "contact@petprotect.com"
  c.species = ["cats", "dogs", "squirrels"]
  c.languages = ["日本語"]
  c.user = vet03
  c.save!
end

attach_photo(
  pet_protect,
  "https://res.cloudinary.com/rts1307/image/upload/v1772465818/original/PetProtect.png",
  "pet_protect.png"
)

puts "Pet Protect Clinic created"

puts "Finished making clinics"
