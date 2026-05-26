class VaccineDefinition < ApplicationRecord
  belongs_to :species

  has_many :pet_vaccs, dependent: :destroy
end
