puts "Finding or creating species..."
Species.find_or_create_by!(name: "dog", icon: "fa-solid fa-dog")
Species.find_or_create_by!(name: "cat", icon: "fa-solid fa-cat")
Species.find_or_create_by!(name: "bird", icon: "fa-solid fa-crow")
Species.find_or_create_by!(name: "horse", icon: "fa-solid fa-horse")
Species.find_or_create_by!(name: "fish", icon: "fa-solid fa-fish")
Species.find_or_create_by!(name: "rabbit", icon: "fa-solid fa-carrot")

puts "#{Species.count} species in seed."
