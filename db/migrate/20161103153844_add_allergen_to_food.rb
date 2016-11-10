class AddAllergenToFood < ActiveRecord::Migration
  def change
    add_reference :foods, :allergen, index: true, foreign_key: true
  end
end
