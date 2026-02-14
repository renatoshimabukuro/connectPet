class LogsController < ApplicationController
  #All actions need users and pets
  before_action :set_user
  before_action :set_pet

  def index
    @logs = @pet.logs.order(date: :desc)
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_pet
    @pet = @user.pets.find(params[:pet_id])
  end

end
