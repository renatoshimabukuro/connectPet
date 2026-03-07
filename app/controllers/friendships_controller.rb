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

  def edit
    @friendship = Friendship.find(params[:id])
    set_chat
  end

  def update
    @friendship = Friendship.find(params[:id])

    if @friendship.update(friendship_params)
      unless @friendship.accepted == true
        redirect_to root_path, notice: "Chat Request rejected."
      else
        set_chat
        redirect_to user_chat_path(@user.id, @chat.id)
      end
    else
      render :show, status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def friendship_params
    params.require(:friendship).permit(
      :owner, :vet, :pet, :accepted
    )
  end

  def set_chat
    @chat = Chat.unscoped.find_by(owner: @friendship.owner, vet: @friendship.vet, pet: @friendship.pet)

  # redirect_to user_chats_path(@user), alert: "Chat not found" unless @chat
  end
end
