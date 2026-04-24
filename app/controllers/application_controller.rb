class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def after_sign_up_path_for(resource)
    if resource.vet?
      new_clinic_path
    elsif resource.owner?
      new_pet_path
    else
      root_path
    end
  end

  def after_sign_in_path_for(resource)
    if resource.vet? && resource.clinic.nil?
      new_clinic_path
    elsif resource.owner? && resource.pets.empty?
      new_pet_path
    else
      user_pets_path(resource) # or chats_path
    end
  end
end
