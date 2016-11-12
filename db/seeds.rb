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
a8 = Allergen.create(name: 'Nuts and tree nuts')
f1 = Food.create(name: "Cookie")
f2 = Food.create(name: "Milk")
f3 = Food.create(name:"Coconut chips")
i1 = Ingredient.create(name: "Flour")
i2 = Ingredient.create(name: "Milk")
i3 = Ingredient.create(name: "Sugar")
i4 = Ingredient.create(name: "Plant Oil")
i5 = Ingredient.create(name: "Coconut")
i6 = Ingredient.create(name: "Salt")

i1.allergens<<(a6)
i1.allergens<<(a7)
i2.allergens<<(a2)
i4.allergens<<(a8)
i5.allergens<<(a7)
i6.allergens<<(a4)
i6.allergens<<(a5)

f1.ingredients<<(i1)
f2.ingredients<<(i2)
f3.ingredients<<(i3)
f3.ingredients<<(i4)
f3.ingredients<<(i5)
f3.ingredients<<(i6)

yanssie = User.create(email: 'yg@seas.upenn.edu', encrypted_password: 'duibuqi520')
