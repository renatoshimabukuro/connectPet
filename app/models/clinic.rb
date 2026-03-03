class Clinic < ApplicationRecord
  belongs_to :user
  validates :field, presence: true
  validates :clinic_name, presence: true
  # validates :address, presence: true
  validates :contact, presence: true
end
