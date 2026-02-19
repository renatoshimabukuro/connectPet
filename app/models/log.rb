class Log < ApplicationRecord
  belongs_to :pet
  validates :date, presence: true
end
