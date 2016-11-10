class RemoveAllergenFoodJoinTable < ActiveRecord::Migration
  def change

    drop_join_table :allergens, :foods
  end
end
