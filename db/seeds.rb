# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

    admin = User.create(
    username: "admin",
    email: "admin@upenn.edu",
    password: "12345678",
    password_confirmation: "12345678")
    admin.update_attribute :admin, true

    # => ceate allergens
    (["Peanuts and Tree Nuts"] + %w[Seafood Shellfish Milk Egg Soy Wheat Gulten]).each do |allergen|
       Allergen.create(name: allergen)
    end
 

