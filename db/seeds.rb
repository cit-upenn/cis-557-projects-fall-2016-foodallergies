# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Allergen.create(name: 'Soy')
Allergen.create(name: 'Diary')
Allergen.create(name: 'Eggs')
Allergen.create(name: 'Seafood')
Allergen.create(name: 'Shellfish')
Allergen.create(name: 'Wheat')
Allergen.create(name: 'Gluten')
Allergen.create(name: 'Nuts and treenuts')

a1 = Allergen.create(name: 'Soy')
a2 = Allergen.create(name: 'Diary')
a3 = Allergen.create(name: 'Eggs')
a4 = Allergen.create(name: 'Seafood')
a5 = Allergen.create(name: 'Shellfish')
a6 = Allergen.create(name: 'Wheat')
a7 = Allergen.create(name: 'Gluten')
a8 Allergen.create(name: 'Nuts and treenuts')
f1 = Food.create(name: "Cookie")
f2 = Food.create(name: "Milk")
i1 = Ingredient.create(name: "Flour")
i2 = Ingredient.create(name: "Milk")
i3 = Ingredient.create(name: "Sugar")
i4 = Ingredient.create(name: "Plant Oil")

ingredients << (a6, a7)
i2 << (a2)
i4 << (a8)

f1 << (i1, i2, i3, i4)
f2 << (i2)

yanssie = User.create(email: 'yg@seas.upenn.edu', encrypted_password: 'duibuqi520')