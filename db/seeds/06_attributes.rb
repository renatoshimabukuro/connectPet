puts "Creating attribute definitions..."

appetite = AttributeDefinition.find_or_create_by!(
  name: "Appetite",
  user: nil
) do |attr|
  attr.value_type = :range
  attr.icon = "mdi:silverware-fork-knife"
end

nausea = AttributeDefinition.find_or_create_by!(
  name: "Nausea",
  user: nil
) do |attr|
  attr.value_type = :boolean
  attr.icon = "streamline:smiley-nauseas-remix"
end

toilet = AttributeDefinition.find_or_create_by!(
  name: "Toilet",
  user: nil
) do |attr|
  attr.value_type = :boolean
  attr.icon = "mdi:toilet"
end

puts "Attribute definitions created"

puts "Assigning attributes to pets..."

def assign_attrs(pet_name, attrs)
  pet = Pet.find_by!(name: pet_name)

  attrs.each do |attr|
    PetAttribute.find_or_create_by!(
      pet: pet,
      attribute_definition: attr
    )
  end
end

assign_attrs("Raye",  [appetite, nausea, toilet])
assign_attrs("Percy", [appetite, nausea, toilet])
assign_attrs("Cory",  [appetite, toilet])
assign_attrs("Maple", [appetite, nausea, toilet])

puts "Attributes assigned"
