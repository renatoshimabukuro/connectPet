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

    existing_count = @pet.pet_attributes.count
    available_slots = 5 - existing_count

    attribute_ids.take(available_slots).each do |attribute_id|
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
