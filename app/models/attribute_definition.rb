class AttributeDefinition < ApplicationRecord
  belongs_to :user, optional: true

  has_many :pet_attributes, dependent: :destroy

  enum value_type: {
    boolean: 0,
    range: 1
  }

  validates :name, presence: true

  scope :available_for, ->(user) {
    where(user_id: nil).or(where(user_id: user.id))
  }

  ICON_OPTIONS = {
    "Water"         =>    "fa-solid fa-droplet",
    "Medication"    =>    "fa-solid fa-pills",
    "Sleep"         =>    "fa-solid fa-bed",
    "Energy"        =>    "fa-solid fa-bolt",
    "Mood"          =>    "fa-solid fa-face-smile",
    "Activity"      =>    "fa-solid fa-paw",
    "Mobility"      =>    "fa-solid fa-person-walking",
    "Temperature"   =>    "fa-solid fa-temperature-half"
  }.freeze

end
