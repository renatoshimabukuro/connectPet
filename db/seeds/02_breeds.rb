puts "Creating breeds..."

dog = Species.find_by(name: "dog")
Breed.find_or_create_by!(name: "German Shepherd", species: dog)
Breed.find_or_create_by!(name: "Toy Poodle", species: dog)
cat = Species.find_by(name: "cat")
Breed.find_or_create_by!(name: "British Shorthair", species: cat)
Breed.find_or_create_by!(name: "Persian", species: cat)
Breed.find_or_create_by!(name: "Mixed", species: cat)
Breed.find_or_create_by!(name: "Exotic shorthair", species: cat)

puts "#{Breed.count} breeds in seed."
