class MessagesController < ApplicationController
  # All actions require user
  before_action :set_user
  # All actions require chat
  before_action :set_chat

  def create
    @message = @chat.messages.build(message_params)
    @message.user = @user

    if @message.save
      redirect_to user_chat_path(@user, @chat)
    else
      @messages = @chat.messages.includes(:user)
      render "chats/show"
    end
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_chat
    @chat = Chat.find(params[:chat_id])
  end

  def message_params
    params.require(:message).permit(:contents)
  end

end
