class ChatsController < ApplicationController
  # All actions require user
  before_action :set_user
  before_action :set_chat, only: [:show, :archive]

  def index
    # Make it so we can only see chats where the user is either owner or vet -> could be made better with pundit?
    @chats = Chat.where("owner_id = ? OR vet_id = ?", @user.id, @user.id)

    if params[:archived] == "true"
      @chats = @chats.archived
      @is_archivied_view = true
    else
      @chats = Chat.where("owner_id = ? OR vet_id = ?", @user.id, @user.id)
      @is_archivied_view = false
    end
  end

  def show
    #After set chat
    #messages shown by order
    @messages = @chat.messages.includes(:user).order(:created_at)
    @message = @chat.messages.build
  end

  def new
    #make a new chat - I want to refactor so you can make a new chat and new message at the same time
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

  def archive
    @chat.archive!
    redirect_to user_chats_path, notice: "Chat was successfully archived."
  end

  def unarchive
    @chat = Chat.unscoped.find(params[:id])
    @chat.update(archived: false)
    redirect_to user_chats_path(current_user, archived: true), notice: "Chat was restored."
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
