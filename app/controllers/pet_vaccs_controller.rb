class PetVaccsController < ApplicationController

  def new
    @pet = Pet.new
    @pet.pet_vaccs.build
  end

def create
  @pet = Pet.find(params[:pet_id])
  @pet_vacc = @pet.pet_vaccs.build(pet_vacc_params)

  if @pet_vacc.save
    redirect_to new_user_pet_pet_attribute_path(@pet.user, @pet)
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
      :pet_id, :vaccine_definition_id,:administered_on,
      :expires_on, :notes, :reminder_set_at
  )
  end

  def set_user
    @user = User.find(params[:user_id])

    if @user != current_user
      redirect_to root_path, alert: "Unauthorized access."
    end
  end
end
