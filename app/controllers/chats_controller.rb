class ChatsController < ApplicationController
  # All actions require user
  before_action :set_user
  before_action :set_chat, only: [:show]

  def index
    @chats = Chat.where("owner_id = ? OR vet_id = ?", @user.id, @user.id)
  end

  def show
    @messages = @chat.messages.includes(:user).order(:created_at)
    @message = @chat.messages.build
  end

  def new
    @chat = Chat.new
  end

  def create
    @user = User.find(params[:user_id])
    @chat = Chat.new(chat_params)
    @chat.owner = @user

    if @chat.save
      redirect_to user_chat_path(@user, @chat)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit

  end

  def update

  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_chat
    @chat = Chat
            .where("owner_id = ? OR vet_id = ?", @user.id, @user.id)
            .find_by(id: params[:id])

  redirect_to user_chats_path(@user), alert: "Chat not found" unless @chat
  end

  def chat_params
    params.require(:chat).permit(:vet_id, :pet_id)
  end

end
