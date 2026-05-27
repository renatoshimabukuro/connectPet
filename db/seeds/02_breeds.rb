puts "Creating breeds..."

dog = Species.find_by(name: "dog")
Breed.find_or_create_by!(name: "German Shepherd", species: dog)
Breed.find_or_create_by!(name: "Toy Poodle", species: dog)
Breed.find_or_create_by!(name: "Chihuahua", species: dog)
Breed.find_or_create_by!(name: "Miniature Dachshund", species: dog)
Breed.find_or_create_by!(name: "Shiba Inu", species: dog)
Breed.find_or_create_by!(name: "Mixed", species: dog)
Breed.find_or_create_by!(name: "Pomeranian", species: dog)
Breed.find_or_create_by!(name: "Miniature Schnauzer", species: dog)
Breed.find_or_create_by!(name: "French Bulldog", species: dog)
Breed.find_or_create_by!(name: "Yorkshire Terrier", species: dog)
Breed.find_or_create_by!(name: "Maltese", species: dog)
Breed.find_or_create_by!(name: "Labrador Retriever", species: dog)
Breed.find_or_create_by!(name: "Golden Retriever", species: dog)
Breed.find_or_create_by!(name: "King Charles Spaniel", species: dog)
Breed.find_or_create_by!(name: "Corgi", species: dog)
Breed.find_or_create_by!(name: "Shih Tzu", species: dog)
Breed.find_or_create_by!(name: "Pug", species: dog)
Breed.find_or_create_by!(name: "Beagle", species: dog)
Breed.find_or_create_by!(name: "Boston Terrier", species: dog)
Breed.find_or_create_by!(name: "Jack Russell Terrier", species: dog)
Breed.find_or_create_by!(name: "Papillon", species: dog)
puts "------------- DOG BREEDS FINISHED -------------"

cat = Species.find_by(name: "cat")
Breed.find_or_create_by!(name: "British Shorthair", species: cat)
Breed.find_or_create_by!(name: "Persian", species: cat)
Breed.find_or_create_by!(name: "Mixed", species: cat)
Breed.find_or_create_by!(name: "Exotic shorthair", species: cat)

puts "#{Breed.count} breeds in seed."
