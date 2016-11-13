class CreateAllergensUsers < ActiveRecord::Migration
  def change
    create_table :allergens_users do |t|
      t.references :user, index: true, foreign_key: true
      t.references :allergen, index: true, foreign_key: true
    end
  end
end
