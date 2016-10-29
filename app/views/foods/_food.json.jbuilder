json.extract! food, :id, :name, :product_barcode, :created_at, :updated_at
json.url food_url(food, format: :json)