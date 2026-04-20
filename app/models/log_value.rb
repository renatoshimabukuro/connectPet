class LogValue < ApplicationRecord
  belongs_to :log
  belongs_to :pet_attribute
end
