class IngredientsPets < ActiveRecord::Migration
  def change
      create_table :ingredients_pets, :id=> false do |t|
          t.integer :ingredient_id
          t.integer :pet_id
      end
  end
end
