class BreedsController < ApplicationController
  def index
    breeds = Breed.where(species_id: params[:species_id])
    render json: breeds.select(:id, :name)
  end
end
