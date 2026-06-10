class AttributeDefinitionsController < ApplicationController

  def new
    @attribute_definition = AttributeDefinition.new
    @pet_id = params[:pet_id]
  end

  def create
    @attribute_definition = AttributeDefinition.new(attribute_definition_params)
    @attribute_definition.user = current_user
    @pet = current_user.pets.find(params[:pet_id])

    if @attribute_definition.save
      @pet.pet_attributes.find_or_create_by!(
        attribute_definition: @attribute_definition
      )

      redirect_to new_user_pet_pet_attribute_path(current_user, @pet)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def attribute_definition_params
    params.require(:attribute_definition).permit(:name, :icon, :value_type)
  end
end
