class Ingredient < ActiveRecord::Base
    has_many :pets
end
