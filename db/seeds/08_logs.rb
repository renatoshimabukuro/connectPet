# db/seeds/07_logs.rb

puts "Adding log helper"

def create_logs_with_values(pet_name:, date:, values:)
  pet = Pet.find_by!(name: pet_name)

  log = Log.find_or_initialize_by(
    pet: pet,
    date: date
  )

  log.save!

  values.each do |attr_name, data|
    attr_def = AttributeDefinition.find_by!(name: attr_name)

    pet_attr = PetAttribute.find_by!(
      pet: pet,
      attribute_definition: attr_def
    )

    log_value = LogValue.find_or_initialize_by(
      log: log,
      pet_attribute: pet_attr
    )

    if attr_def.range?
      log_value.range_value = data[:value]
      log_value.boolean_value = nil
    elsif attr_def.boolean?
      log_value.boolean_value = data[:value]
      log_value.range_value = nil
    end

    log_value.memo = data[:memo]
    log_value.save!
  end

  log
end

start_date = 1.week.ago.to_date

puts "Creating logs for pets..."

create_logs_with_values(
  pet_name: "Raye",
  date: start_date,
  values: {
    "Appetite" => { value: 5, memo: "50g" },
    "Nausea"   => { value: true, memo: "Threw up in the cat room" },
    "Toilet"   => { value: true, memo: "Poop in the morning" }
  }
)

create_logs_with_values(
  pet_name: "Raye",
  date: start_date + 1,
  values: {
    "Appetite" => { value: 4, memo: "45g" },
    "Nausea"   => { value: false, memo: "" },
    "Toilet"   => { value: true, memo: "" }
  }
)

create_logs_with_values(
  pet_name: "Raye",
  date: start_date + 2,
  values: {
    "Appetite" => { value: 3, memo: "40g" },
    "Nausea"   => { value: true, memo: "Threw up in the cat room" },
    "Toilet"   => { value: true, memo: "No poop" }
  }
)

create_logs_with_values(
  pet_name: "Raye",
  date: start_date + 3,
  values: {
    "Appetite" => { value: 5, memo: "50g" },
    "Nausea"   => { value: false, memo: "" },
    "Toilet"   => { value: true, memo: "Small poop" }
  }
)

create_logs_with_values(
  pet_name: "Raye",
  date: start_date + 4,
  values: {
    "Appetite" => { value: 3, memo: "35g" },
    "Nausea"   => { value: true, memo: "Hacking, no vomit" },
    "Toilet"   => { value: true, memo: "" }
  }
)

create_logs_with_values(
  pet_name: "Raye",
  date: start_date + 5,
  values: {
    "Appetite" => { value: 3, memo: "40g" },
    "Nausea"   => { value: false, memo: "" },
    "Toilet"   => { value: true, memo: "" }
  }
)

create_logs_with_values(
  pet_name: "Raye",
  date: start_date + 6,
  values: {
    "Appetite" => { value: 4, memo: "45g" },
    "Nausea"   => { value: false, memo: "" },
    "Toilet"   => { value: true, memo: "No poop" }
  }
)

create_logs_with_values(
  pet_name: "Cory",
  date: start_date + 6,
  values: {
    "Appetite" => { value: 5, memo: "50g" },
    "Toilet"   => { value: true, memo: "" }
  }
)

create_logs_with_values(
  pet_name: "Maple",
  date: start_date + 6,
  values: {
    "Appetite" => { value: 4, memo: "45g" },
    "Nausea"   => { value: false, memo: "" },
    "Toilet"   => { value: true, memo: "Poop in the morning!" }
  }
)

puts "Created #{Log.count} logs"
