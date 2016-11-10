class RemoveAllergenIdFromFood < ActiveRecord::Migration
  def change
    remove_reference :foods, :allergen, index: true, foreign_key: true
  end
end
