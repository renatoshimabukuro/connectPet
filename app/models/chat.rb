class Chat < ApplicationRecord
  belongs_to :owner
  belongs_to :vet
  belongs_to :pet
end
