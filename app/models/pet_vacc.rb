class PetVacc < ApplicationRecord
  belongs_to :pet
  belongs_to :vaccine_definition

  before_validation :calculate_expiration

  private

  def calculate_expiration
    return unless administered_on.present?
    return unless vaccine_definition.present?

    self.expires_on =
      administered_on + vaccine_definition.default_duration_days.days
  end
end
