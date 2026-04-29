class Breed < ApplicationRecord
  belongs_to :species
  has_many :pets
end
