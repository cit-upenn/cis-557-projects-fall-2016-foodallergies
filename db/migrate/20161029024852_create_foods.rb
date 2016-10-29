class CreateFoods < ActiveRecord::Migration
  def change
    create_table :foods do |t|
      t.string :name
      t.integer :product_barcode

      t.timestamps null: false
    end
  end
end
