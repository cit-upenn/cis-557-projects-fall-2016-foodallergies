class CreateFoodIngredientJoinTable < ActiveRecord::Migration
  def change
    create_join_table :foods, :ingredients do |t|
      t.index [:food_id, :ingredient_id]
      t.index [:ingredient_id, :food_id]
    end
  end
end
