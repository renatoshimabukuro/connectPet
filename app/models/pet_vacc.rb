class PetVacc < ApplicationRecord
  belongs_to :pet
  belongs_to :vaccine_definition
end
