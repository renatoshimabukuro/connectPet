class PetAttributesController < ApplicationController


  def new
    @user = current_user

    @pet = @user.pets.find(params[:pet_id])

    @attribute_definitions =
      AttributeDefinition
        .where(user_id: nil)
        .or(
          AttributeDefinition.where(user_id: current_user.id)
        )
        .order(:name)
  end

  def create
  @pet = current_user.pets.find(params[:pet_id])

  @pet_attribute = @pet.pet_attributes.new(pet_attribute_params)

  if @pet_attribute.save
    redirect_to user_pet_path(current_user, @pet)
  else
    render :new, status: :unprocessable_entity
  end
end

  private

  def pet_attribute_params
    params.require(:pet_attribute).permit(
      :attribute_definition_id,
      :icon
    )
  end
end
