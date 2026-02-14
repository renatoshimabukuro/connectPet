class PetsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_pet, only: [:show, :edit, :update, :destroy]
  def index
    @pets = current_user.pets
  end

  def show
  end

  def new
    @pet = Pet.new
  end

  def create
    @pet = Pet.new(pet_params)
    @pet.user = current_user

    if @pet.save
      redirect_to @pet
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
