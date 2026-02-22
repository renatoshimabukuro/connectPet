class Pet < ApplicationRecord
  belongs_to :user
  has_many :logs, dependent: :destroy
  has_one_attached :photo

  validates :name, presence: true
  validates :dob, presence: true
  validates :species, presence: true
  validates :breed, presence: true
  validates :vacc_status, presence: true
end
