puts "Creating users..."
User.find_or_initialize_by(email: "katie@owner.com").tap do |user|
  user.first_name = "Katie"
  user.last_name  = "Wood"
  user.password   = "password123"
  user.role       = "owner"
  user.country    = "JP"
  user.city       = "Matsuyama"
  user.save!
end

User.find_or_initialize_by(email: "renato@owner.com").tap do |user|
  user.first_name = "Renato"
  user.last_name  = "Shimabukuro"
  user.password   = "password123"
  user.role       = "owner"
  user.country    = "JP"
  user.city       = "Tokyo"
  user.save!
end

User.find_or_initialize_by(email: "troy@owner.com").tap do |user|
  user.first_name = "Troy"
  user.last_name  = "Zangara"
  user.password   = "password123"
  user.role       = "owner"
  user.country    = "JP"
  user.city       = "Osaka"
  user.save!
end

User.find_or_initialize_by(email: "patrick@vet.com").tap do |user|
  user.first_name = "Patrick Gregory"
  user.last_name  = "House"
  user.password   = "password123"
  user.role       = "vet"
  user.country    = "JP"
  user.city       = "Matsuyama"
  user.save!
end

User.find_or_initialize_by(email: "james@vet.com").tap do |user|
  user.first_name = "James"
  user.last_name  = "Hetfield"
  user.password   = "password123"
  user.role       = "vet"
  user.country    = "JP"
  user.city       = "Matsuyama"
  user.save!
end

User.find_or_initialize_by(email: "john@vet.com").tap do |user|
  user.first_name = "John"
  user.last_name  = "Sykes"
  user.password   = "password123"
  user.role       = "vet"
  user.country    = "JP"
  user.city       = "Matsuyama"
  user.save!
end

puts "#{User.count} users in seed."
