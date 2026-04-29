class ApplicationController < ActionController::Base
  before_action :authenticate_user!, unless: :devise_controller?
  before_action :configure_permitted_parameters, if: :devise_controller?

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
    if resource.vet?
      if resource.clinic.nil?
        new_clinic_path
      else
        chats_path
      end
    elsif resource.owner?
      if resource.pets.empty?
        new_user_pet_path(resource)
      else
        user_pets_path(resource)
      end
    else
      root_path
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:role, :first_name, :last_name, :country, :city])
  end
end
