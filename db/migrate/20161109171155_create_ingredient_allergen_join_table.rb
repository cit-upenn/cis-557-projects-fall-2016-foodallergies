class CreateIngredientAllergenJoinTable < ActiveRecord::Migration
  def change
    create_join_table :ingredients, :allergens do |t|
      # t.index [:ingredient_id, :allergen_id]
      # t.index [:allergen_id, :ingredient_id]
    end
  end
end
