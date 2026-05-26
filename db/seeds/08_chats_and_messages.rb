def user(email)
  User.find_by!(email: email)
end

def pet(user_email, name)
  Pet.joins(:user).find_by!(
    users: { email: user_email },
    name: name
  )
end

def vet(email)
  User.find_by!(email: email)
end

puts "Creating chats..."

chat1 = Chat.find_or_initialize_by(
  owner: user("katie@owner.com"),
  vet: vet("patrick@vet.com"),
  pet: pet("katie@owner.com", "Raye")
).tap do |c|
  c.archived = false
  c.created_at = Date.parse("2026-02-24")
  c.updated_at = Date.parse("2026-02-24")
  c.save!
end

chat2 = Chat.find_or_initialize_by(
  owner: user("renato@owner.com"),
  vet: vet("patrick@vet.com"),
  pet: pet("renato@owner.com", "Maple")
).tap do |c|
  c.archived = false
  c.save!
end

chat3 = Chat.find_or_initialize_by(
  owner: user("katie@owner.com"),
  vet: vet("james@vet.com"),
  pet: pet("katie@owner.com", "Percy")
).tap do |c|
  c.archived = false
  c.created_at = Date.parse("2026-01-30")
  c.updated_at = Date.parse("2026-01-30")
  c.save!
end

puts "Creating friendships"

def friendship(owner_email, vet_email, pet_name)
  Friendship.find_or_create_by!(
    owner: user(owner_email),
    vet: vet(vet_email),
    pet: pet(owner_email, pet_name)
  ) do |f|
    f.accepted = true
  end
end

friendship("katie@owner.com", "patrick@vet.com", "Raye")
friendship("renato@owner.com", "patrick@vet.com", "Maple")
friendship("katie@owner.com", "james@vet.com", "Percy")

def add_message(chat, email, text, time)
  Message.find_or_create_by!(
    chat: chat,
    user: User.find_by!(email: email),
    contents: text,
    created_at: time,
    updated_at: time
  )
end

puts "Creating messages..."

# Chat 1
add_message(chat1, "katie@owner.com", "Hello Doctor, Raye has been heaving.", Time.zone.parse("2026-02-24 10:00:00"))
add_message(chat1, "patrick@vet.com", "How long has this been happening?", Time.zone.parse("2026-02-24 10:05:00"))
add_message(chat1, "katie@owner.com", "About two days.", Time.zone.parse("2026-02-24 10:15:00"))
add_message(chat1, "patrick@vet.com", "Any changes in appetite?", Time.zone.parse("2026-02-24 10:20:00"))
add_message(chat1, "katie@owner.com", "No, appetite is normal.", Time.zone.parse("2026-02-24 10:30:00"))
add_message(chat1, "patrick@vet.com", "Please bring Raye in tomorrow at 10am.", Time.zone.parse("2026-02-24 10:45:00"))

# Chat 2
add_message(chat2, "renato@owner.com", "Hi Doctor, Maple is not eating much.", Time.zone.now)
add_message(chat2, "patrick@vet.com", "Has she been vomiting?", Time.zone.now)
add_message(chat2, "renato@owner.com", "No vomiting, just low appetite.", Time.zone.now)
add_message(chat2, "patrick@vet.com", "Let's schedule a checkup this week.", Time.zone.now)
add_message(chat2, "renato@owner.com", "Thank you, that would be great.", Time.zone.now)

# Chat 3
add_message(chat3, "katie@owner.com", "Percy hasn't been going toilet very often", Time.zone.parse("2026-01-30 10:00:00"))
add_message(chat3, "james@vet.com", "That's concerning. Any other symptoms?", Time.zone.parse("2026-01-30 10:10:00"))
add_message(chat3, "katie@owner.com", "His appetite is a little low.", Time.zone.parse("2026-01-30 11:00:00"))
add_message(chat3, "james@vet.com", "Alright, let's make an appointment for tomorrow. How is 3pm?", Time.zone.parse("2026-01-30 11:10:00"))
add_message(chat3, "katie@owner.com", "Perfect. Thank you.", Time.zone.parse("2026-01-30 11:15:00"))
