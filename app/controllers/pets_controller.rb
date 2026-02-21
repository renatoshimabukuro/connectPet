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
    # fetch the user's other pets except the current one, to show in the circles
    @other_pets = @user.pets.where.not(id: @pet.id).limit(2)
  end

  # GET /users/:user_id/pets/new
  def new
    @pet = Pet.new
  end

  # POST /users/:user_id/pets
  def create
    @pet = Pet.new(pet_params)
    @pet.user = @user

    if @pet.save
      redirect_to [@user, @pet], notice: 'Pet was successfully registered!'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = User.find(params[:user_id])

    if @user != current_user
      redirect_to root_path, alert: "Unauthorized access."
    end
  end

  def set_pet
    @pet = @user.pets.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to user_pets_path(@user), alert: "Pet not found or access denied."
  end

  def destroy
      @pet = @user.pets.find(params[:id])
      @pet.destroy

  end

  def pet_params
    params.require(:pet).permit(
      :name, :dob, :species, :breed, :microchip,
      :weight, :current_meds, :vacc_status, :notes,
      :insurance, :fixed, :gender, :photo
    )
  end
end
