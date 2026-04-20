class Log < ApplicationRecord
  belongs_to :pet
  has_many :log_values, dependent: :destroy

  validates :date, presence: true
end
