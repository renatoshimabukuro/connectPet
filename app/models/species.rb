class Species < ApplicationRecord
  has_many :pets
  has_many :breeds, dependent: :destroy
end
