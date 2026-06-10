class PetAttribute < ApplicationRecord
  belongs_to :pet
  belongs_to :attribute_definition

  has_many :log_values, dependent: :destroy

  validates :attribute_definition_id, uniqueness: { scope: :pet_id }

  after_commit :refresh_pet_onboarding

  def display_icon
    icon.presence || attribute_definition.icon
  end

  private

  def refresh_pet_onboarding
    pet.refresh_onboarding!
  end
end
