class Log < ApplicationRecord
  belongs_to :pet
  validates :health, presence: true
  validates :date, presence: true
end
