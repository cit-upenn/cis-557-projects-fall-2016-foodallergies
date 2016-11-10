class RemoveFoodIdFromAllergen < ActiveRecord::Migration
  def change
    remove_reference :allergens, :food, index: true, foreign_key: true
  end
end
