class AttributeDefinitionsController < ApplicationController

  def new

  end

  def create
    attribute = current_user.attribute_definitions.new(attribute_params)

    if attribute.save
      render json: attribute
    else
      render json: { errors: attribute.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def attribute_params
    params.require(:attribute_definitions).permit(:name, :icon, :value_type)
  end
end
