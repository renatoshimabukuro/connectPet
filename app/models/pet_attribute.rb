class PetAttribute < ApplicationRecord
  belongs_to :pet
  belongs_to :attribute_definition

  has_many :log_values, dependent: :destroy

  validates :attribute_definition_id, uniqueness: { scope: :pet_id }

  def display_icon
    icon.presence || attribute_definition.icon
  end
end
