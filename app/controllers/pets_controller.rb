class PetsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user
  before_action :set_pet, only: [:show, :edit, :update, :destroy]


  # GET /users/:user_id/pets
  def index
    @pets = @user.pets
  end

  # GET /users/:user_id/pets/:id
  def show
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

  # GET /users/:user_id/pets/:id/edit
  def edit
  end

  # PATCH /users/:user_id/pets/:id
  def update
      if @pet.update(pet_params)
        redirect_to [@user, @pet], notice: 'Pet profile was updated.'
      else
        render :edit, status: :unprocessable_entity
      end
  end

# DELETE /users/:user_id/pets/:id
  def destroy
    @pet.destroy
      redirect_to user_pets_path(@user), notice: 'Pet was removed.'
  end

private

  def set_user
      # using this so that you can ignore the ID in the URL and always use the logged in user
    @user = current_user
  end

  def set_pet
      # Search only within the @user's pets for safety
      @pet = @user.pets.find(params[:id])
  rescue ActiveRecord::RecordNotFound
      redirect_to user_pets_path(@user), alert: "Pet not found or access denied."
  end

  def pet_params
      params.require(:pet).permit(
        :name, :dob, :species, :breed, :microchip,
        :weight, :current_meds, :vacc_status, :notes,
        :insurance, :fixed?, :gender
      )
  end

end
