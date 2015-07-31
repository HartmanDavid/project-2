class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
      t.boolean :chicken, default: false
      t.boolean :duck, default: false
      t.boolean :turkey, default: false
      t.boolean :beef, default: false

      t.timestamps null: false
    end
  end
end
