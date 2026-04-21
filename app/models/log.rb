class Log < ApplicationRecord
  belongs_to :pet
  has_many :log_values, dependent: :destroy

  accepts_nested_attributes_for :log_values

  validates :date, presence: true
end
