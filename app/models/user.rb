class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  #validations
  validates :role, presence: true, inclusion:{in:["vet", "owner"], allow_nil:false}
  validates :name, presence: true
  # has many owned chats where user is "owner"
  has_many :owned_chats, class_name: "Chat", foreign_key: :owner_id, dependent: :destroy
  # has many owned chats where user is "vet"
  has_many :vet_chats, class_name: "Chat", foreign_key: :vet_id, dependent: :destroy
  # has many messages regardless of role and messages are dependent on chat to persist
  has_many :messages, dependent: :destroy
end
