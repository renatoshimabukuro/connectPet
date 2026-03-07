class Friendship < ApplicationRecord
  belongs_to :owner, class_name: "User"
  belongs_to :vet, class_name: "User"
  belongs_to :pet
end
