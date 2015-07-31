class Ingredient < ActiveRecord::Base
    has_many :ingredients_pets
    has_many :pets, through: :ingredients_pets
    # validates :name, presence: true, uniqueness: true
end
