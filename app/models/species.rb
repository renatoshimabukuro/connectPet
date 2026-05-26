class Species < ApplicationRecord
  has_many :pets
  has_many :breeds, dependent: :destroy
  has_many :vaccine_definitions, dependent: :destroy
end
