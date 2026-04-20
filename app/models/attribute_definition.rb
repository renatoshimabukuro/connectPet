class AttributeDefinition < ApplicationRecord
  belongs_to :user, optional: true

  has_many :pet_attributes, dependent: :destroy

  enum value_type: {
    boolean: 0,
    range: 1
  }

  validates :name, presence: true

  scope :available_for, ->(user) {
    where(user_id: nill).or(where(user_id: user.id))
  }
end
