class PetsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user
  before_action :set_pet, only: [:show]

  # GET /users/:user_id/pets
  def index
    @pets = @user.pets
  end

  # GET /users/:user_id/pets/:id
  def show
    @log = Log.new
  end

  # GET /users/:user_id/pets/new
  def new
    @pet = Pet.new
  end

  # POST /users/:user_id/pets
  def create
    @pet = Pet.new(pet_params)
    @pet.user = @user # this is linking the pet to the current_user

    if @pet.save
      # this is using the array syntax for nested routes because our routes are very nested
      redirect_to [@user, @pet], notice: 'Pet was successfully registered!'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_user
    # this finds the user from the URL
    @user = User.find(params[:user_id])

    # this stop the request if the URL ID doesn't match the logged in user
    if @user != current_user
      redirect_to root_path, alert: "Unauthorized access."
    end
  end

  def set_pet
      # this searches only within the @user's pets for safety.........
      @pet = @user.pets.find(params[:id])
  rescue ActiveRecord::RecordNotFound
      redirect_to user_pets_path(@user), alert: "Pet not found or access denied."
  end

  def pet_params
      params.require(:pet).permit(
        :name, :dob, :species, :breed, :microchip,
        :weight, :current_meds, :vacc_status, :notes,
        :insurance, :fixed, :gender
      )
  end
end
