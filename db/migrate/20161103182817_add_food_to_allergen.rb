class AddFoodToAllergen < ActiveRecord::Migration
  def change
    add_reference :allergens, :food, index: true, foreign_key: true
  end
end
