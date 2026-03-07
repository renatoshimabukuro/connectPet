class Clinic < ApplicationRecord
include PgSearch::Model

  belongs_to :user
  validates :field, presence: true
  validates :clinic_name, presence: true
  # validates :address, presence: true
  validates :contact, presence: true
  has_one_attached :photo

  pg_search_scope :search_by_clinic,
  against: [ :clinic_name, :species, :field ],
  using: {
    tsearch: { prefix: true }
  }

end
