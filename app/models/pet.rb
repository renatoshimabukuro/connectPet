class Pet < ApplicationRecord
  belongs_to :user
  has_many :logs
  validates :name, presence: true
  validates :dob, presence: true
  validates :species, presence: true
  validates :breed, presence: true
  validates :vacc_status, presence: true
end
