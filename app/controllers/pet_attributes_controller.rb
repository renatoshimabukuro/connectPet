class PetAttributesController < ApplicationController

  def create
    pet = current_user.pets.find(params[:pet_id])

    pet_attribute = pet.pet_attributes.new(
      attribute_definition_id: params[:attribute_definition_id],
      icon: params[:icon]
    )

    if pet_attribute.save
      redirect_to user_pet_path(@user, @pet)
    else
      render :new, status: :unprocessable_entity
    end
  end
end
