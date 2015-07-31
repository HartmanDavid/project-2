class Pet < ActiveRecord::Base
  belongs_to :user
  has_many :ingredients_pets
  has_many :ingredients, through: :ingredients_pets
  # validates :user_id, presence: true
end
