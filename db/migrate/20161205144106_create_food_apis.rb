class CreateFoodApis < ActiveRecord::Migration
  def change
    create_table :food_apis do |t|
      t.timestamps null: false
    end
  end
end
