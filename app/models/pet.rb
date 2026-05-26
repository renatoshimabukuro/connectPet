class Pet < ApplicationRecord
  belongs_to :user
  belongs_to :species
  belongs_to :breed

  has_many :chats, dependent: :destroy
  has_many :logs, dependent: :destroy
  has_many :pet_attributes, dependent: :destroy
  has_many :attribute_definitions, through: :pet_attributes
  has_many :pet_vaccs, dependent: :destroy
  has_many :vaccine_definitions, through: :pet_vaccs

  has_one_attached :photo

  validates :name, presence: true
  validates :dob, presence: true
  validates :species, presence: true

  # Attribute archived is active by default
  attribute :archived, :boolean, default: false

  # Define a default scope to only show active pet
  default_scope { where(archived: false) }

  # Scope to easily retrieve archived pets
  scope :archived, -> { unscoped.where(archived: true) }

  # Method to archive a pet
  def archive!
    update(archived: true)
  end

  # Method to unarchive a pet
  def unarchive!
    update(archived: false)
  end
end
