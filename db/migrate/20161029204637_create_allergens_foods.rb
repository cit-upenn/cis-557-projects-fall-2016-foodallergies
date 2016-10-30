class CreateAllergensFoods < ActiveRecord::Migration
  def change
    create_table :allergens_foods do |t| 
      t.integer :allergen_id
      t.integer :food_id
    end
  end
end
