puts "Creating vaccines..."

dog = Species.find_by(name: "dog")

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

cat = Species.find_by(name: "cat")

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

rabbit = Species.find_by(name: "rabbit")

VaccineDefinition.find_or_create_by!(name: "Rabbit Hemorrhagic Disease (RHDV2)", species: rabbit) do |vacc|
  vacc.default_duration_days = 365
end

horse = Species.find_by(name: "horse")

VaccineDefinition.find_or_create_by!(name: "Equine Influenza", species: horse) do |vacc|
  vacc.default_duration_days = 365
end

VaccineDefinition.find_or_create_by!(name: "Tetanus", species: horse) do |vacc|
  vacc.default_duration_days = 365
end

VaccineDefinition.find_or_create_by!(name: "Japanese Encephalitis", species: horse) do |vacc|
  vacc.default_duration_days = 365
end

puts "Created vaccines."
