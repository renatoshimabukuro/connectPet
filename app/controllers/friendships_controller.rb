class FriendshipsController < ApplicationController
  before_action :set_user
  def new
    @friendship = Friendship.new
  end
  def create
    if @user.role == "owner"
      owner = @user
      vet = User.find(friendship_params[:vet_id])
      pet = Pet.find(friendship_params[:pet_id])
    else
      vet = @user
      pet = Pet.find(friendship_params[:pet_id])
      owner = pet.user
    end

    @friendship = Friendship.find_or_create_by(
      owner: owner,
      vet: vet,
      pet: pet
    )

  end
  private
  def set_user
    @user = User.find(params[:user_id])
  end

  def friendship_params
    params.require(:friendship).permit(
      :owner, :vet, :pet
    )
  end
end
