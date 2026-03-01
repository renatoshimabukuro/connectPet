class Message < ApplicationRecord
  belongs_to :chat
  belongs_to :user

  validates :contents, presence: true

  def from?(user)
    self.user_id == user.id
  end

  after_create_commit -> {
    broadcast_append_to(
      "chat_#{chat.id}",
      target: "chat-messages",
      partial: "messages/message",
      locals: {
        message: self,
        viewer_id: user_id
      }
    )
  }
end
