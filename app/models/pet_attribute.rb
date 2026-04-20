class PetAttribute < ApplicationRecord
  belongs_to :pet
  belongs_to :attribute_definition
end
