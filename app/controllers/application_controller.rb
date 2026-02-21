class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  def after_sign_in_path_for(resource)
    # sends the user to /users/:id/pets after login
    user_pets_path(resource)
  end
end
