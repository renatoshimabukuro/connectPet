class PetVacc < ApplicationRecord
  belongs_to :pet
  belongs_to :vaccine_definition

  before_validation :calculate_expiration

  after_commit :refresh_pet_onboarding

  private

  def calculate_expiration
    return unless administered_on.present?
    return unless vaccine_definition.present?

    self.expires_on =
      administered_on + vaccine_definition.default_duration_days.days
  end

  def refresh_pet_onboarding
    pet.refresh_onboarding!
  end
end
