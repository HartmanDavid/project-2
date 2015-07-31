class IngredientsPets < ActiveRecord::Migration
  def change
      create_table :ingredients_pets, :id=> false do |t|
          t.references :ingredient
          t.references :pet
      end
  end
end 
