class Friendship < ApplicationRecord
  belongs_to :owner
  belongs_to :vet
end
