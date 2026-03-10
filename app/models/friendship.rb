class Friendship < ApplicationRecord
  # belongs_to :owner, class_name: "User", foreign_key: :owner_id
  # belongs_to :vet, class_name: "User", foreign_key: :vet_id
  # belongs_to :pet

  belongs_to :owner, class_name: "User", foreign_key: :owner_id
  belongs_to :vet, class_name: "User", foreign_key: :vet_id
  belongs_to :pet
  has_one :clinic, through: :vet
end
