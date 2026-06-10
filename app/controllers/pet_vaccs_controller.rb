class PetVaccsController < ApplicationController

  before_action :set_user
  before_action :set_pet

  def index
    @pet_vaccs = @pet.pet_vaccs
                    .includes(:vaccine_definition)
                    .order(expires_on: :desc)
  end

  def new
    @vaccines = VaccineDefinition.where(species: @pet.species)
    @pet_vacc = @pet.pet_vaccs.build
  end

def create
  @pet = Pet.find(params[:pet_id])
  @pet_vacc = @pet.pet_vaccs.build(vacc_params)

  if @pet_vacc.save
    if params[:onboarding]
      redirect_to user_pet_pet_vaccs_path(@pet.user, @pet, onboarding: true)
    else
      redirect_to user_pet_pet_vaccs_path(@pet.user, @pet)
    end
  else
    render :new, status: :unprocessable_entity
  end
end

  def destroy
    pet_vacc = PetVacc.find(params[:id])
    pet = pet_vacc.pet

    pet_vacc.destroy!

    redirect_to pet_path(pet)
  end

  private

  def vacc_params
  params.require(:pet_vacc).permit(
      :pet_id, :vaccine_definition_id,:administered_on, :notes
  )
  end

  def set_user
    @user = User.find(params[:user_id])

    if @user != current_user
      redirect_to root_path, alert: "Unauthorized access."
    end
  end

  def set_pet
    @pet = @user.pets.find(params[:pet_id])
  end
end
