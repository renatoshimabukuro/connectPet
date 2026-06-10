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

    attribute_ids = params[:attribute_definition_ids] || []

    attribute_ids.each do |attribute_id|
      @pet.pet_attributes.find_or_create_by!(
        attribute_definition_id: attribute_id
      )
    end

    redirect_to user_pet_path(current_user, @pet)
  end

  private

  def pet_attribute_params
    params.require(:pet_attribute).permit(
      :attribute_definition_id,
      :icon
    )
  end
end
