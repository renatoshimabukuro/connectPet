class OnboardingController < ApplicationController
  def show
    if current_user.vet?
      redirect_to new_clinic_path unless current_user.clinic
    else
      redirect_to new_pet_path if current_user.pets.empty?
    end
  end
end
