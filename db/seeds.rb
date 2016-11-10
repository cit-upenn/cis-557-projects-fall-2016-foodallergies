# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


a1 = Allergen.create(name: 'Soy')
a2 = Allergen.create(name: 'Diary')
a3 = Allergen.create(name: 'Eggs')
a4 = Allergen.create(name: 'Seafood')
a5 = Allergen.create(name: 'Shellfish')
a6 = Allergen.create(name: 'Wheat')
a7 = Allergen.create(name: 'Gluten')
a8 = Allergen.create(name: 'Nuts and treenuts')
f1 = Food.create(name: "Cookie")
f2 = Food.create(name: "Milk")
i1 = Ingredient.create(name: "Flour")
i2 = Ingredient.create(name: "Milk")
i3 = Ingredient.create(name: "Sugar")
i4 = Ingredient.create(name: "Plant Oil")

i1.allergens<<(a6)
i1.allergens<<(a7)
i2.allergens<<(a2)
i4.allergens<<(a8)

f1.ingredients<<(i1)
f2.ingredients<<(i2)

yanssie = User.create(email: 'yg@seas.upenn.edu', encrypted_password: 'duibuqi520')
