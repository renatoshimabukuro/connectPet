class AttributeDefinitionsController < ApplicationController

  def new
    @attribute_definition = AttributeDefinition.new
  end

  def create
    @attribute_definition = AttributeDefinition.new(attribute_definition_params)
    @attribute_definition.user = current_user

    @pet_id = params[:pet_id]

    if @attribute_definition.save
      redirect_to new_user_pet_pet_attribute_path(
        current_user,
        @pet_id
      )
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def attribute_definition_params
    params.require(:attribute_definitions).permit(:name, :icon, :value_type)
  end
end
