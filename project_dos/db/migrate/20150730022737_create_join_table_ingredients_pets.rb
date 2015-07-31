class CreateJointTableIngredientsPets < ActiveRecord::Migration
  def change
    create_table :ingredients_pets, :id => false do |t|
        t.references :ingredients
        t.references :pets
    end
  end
end
