class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :role, presence: true, inclusion:{in:["vet", "owner"], allow_nil:false}
  validates :name, presence: true
  has_many :pets, dependent: :destroy
  has_many :clinics, dependent: :destroy # to delete the vet's clinic
end
