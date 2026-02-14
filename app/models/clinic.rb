class Clinic < ApplicationRecord
  validates :field, presence: true
  validates :clinic_name, presence: true
  validates :address, presence: true
  validates :contact, presence: true
  validates :species, presence: true
end
