class PetVaccsController < ApplicationController
  def create
    pet = Pet.find(params[:pet_id])
    definition = VaccineDefinition.find(params[:vaccine_definition_id])

    administered_on = params[:administered_on].to_date

    pet.pet_vaccs.create!(
      vaccine_definition: definition,
      administered_on: administered_on,
      expires_on: administered_on + definition.default_duration_days.days,
      notes: params[:notes]
    )

    redirect_to pet_path(pet)
  end

  def destroy
    pet_vacc = PetVacc.find(params[:id])
    pet = pet_vacc.pet

    pet_vacc.destroy!

    redirect_to pet_path(pet)
  end
end
