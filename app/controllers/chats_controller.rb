class ChatsController < ApplicationController
  # All actions require user
  before_action :set_user
  before_action :set_chat, only: [:show, :archive]

  def index
    # Make it so we can only see chats where the user is either owner or vet -> could be made better with pundit?
    @chats = Chat.where("owner_id = ? OR vet_id = ?", @user.id, @user.id)

    if params[:archived] == "true"
      @chats = @chats.archived
      @is_archived_view = true
    else
      @chats = Chat.where("owner_id = ? OR vet_id = ?", @user.id, @user.id)
      @is_archived_view = false
    end
  end

  def show
    #After set chat
    #messages shown by order
    @messages = @chat.messages.includes(:user).order(:created_at)
    @message = @chat.messages.build
  end

  def new
    @chat = Chat.new
    @chat.messages.build
    #
    #@message = Message.new

    # if current_user.role == "owner"
    #   @vets = User.where(role: "vet").all
    #   @pets = current_user.pets
    # else
    #   @pets = Pet.joins(:owner).distinct
    # end
  end

  def create
    if @user.role == "owner"
      owner = @user
      vet = User.find(chat_params[:vet_id])
      pet = Pet.find(chat_params[:pet_id])
    else
      vet = @user
      pet = Pet.find(chat_params[:pet_id])
      owner = pet.user
    end

    @chat = Chat.find_or_create_by!(
      owner: owner,
      vet: vet,
      pet: pet
    )

    # @message = @chat.messages.build(message_params.merge(user: @user))
    #
  message_attrs = chat_params[:messages_attributes]&.values&.first
  @message = @chat.messages.build(message_attrs.merge(user: current_user))


    # @message = @chat.messages.build(
    #   chat_params[:messages_attributes]&.values&.first
    # )


  if @message.save
    redirect_to user_chat_path(@user, @chat)
  else
    @chat.messages = [@message]
    render :new, status: :unprocessable_entity
  end

    # @user = User.find(params[:user_id])
    # @chat = Chat.new(chat_params)
    # @chat.owner = @user

    # if @chat.save
    #   redirect_to user_chat_path(@user, @chat)
    # else
    #   render :new, status: :unprocessable_entity
    # end
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
    params.require(:chat).permit(:vet_id, :pet_id, messages_attributes: [:contents])
  end

  def message_params
    params.require(:chat).require(:messages_attributes).permit(:contents)
  end
end
