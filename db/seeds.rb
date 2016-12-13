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
(["Peanuts and Tree Nuts"] + %w[Seafood Shellfish Milk Egg Soy Wheat Gluten]).each do |allergen|
  Allergen.create(name: allergen)
end


# 1. Peanuts and Tree Nuts:
[ 'peanuts', 'almonds', 'beechnuts', 'Brazil nuts', 'butternuts', 'cashews', 'chestnuts',
  'chinquapin nuts', 'filberts', 'azelnuts', 'ginkgo nuts', 'hickory nuts', 'lychee nuts',
  'macadamia nuts', 'Nangai nuts', 'natural nut extract', 'pecans', 'pili nuts', 'pine nuts',
  'pistachios', 'shea nuts', 'walnuts', 'coconut', 'artificial nuts', 'beer nuts',
  'cold pressed peanut oil', 'expeller pressed peanut oil', 'extruded peanut oil',
  'goobers', 'ground nuts', 'mixed nuts', 'monkey nuts', 'nut pieces', 'nut meat',
  'peanut butter', 'peanut flour', 'peanut protein hydrolysate', 'mandelonas',
  'arachis oil', 'praline', 'walnut hull extract', 'walnut oil', 'almond oil',
  'black walnut hull extract', 'mortadella', 'gianduja'].map(&:capitalize).each do |ingredient|
  allergen = Allergen.find_by_name("Peanuts and Tree Nuts")
  ingredient = Ingredient.find_or_create_by(name: ingredient)
  ingredient.allergens << allergen   unless ingredient.allergens.include? allergen
  allergen.ingredients << ingredient unless allergen.ingredients.include? ingredient
end

#2 Shellfish

[ 'Barnacle', 'Crab', 'Crawfish', 'Crawdad', 'Crayfish', 'Ecrevisse', 'Krill',
  'Lobster', 'Langouste', 'langoustine', 'Moreton bay bugs', 'scampi', 'tomalley',
  'Prawns', 'Shrimp', 'crevette', 'abalone', 'clams', 'cockles', 'mussels',
  'oysters', 'octopi', 'scallops', 'snails', 'esgargot', 'squid', 'calamari'].map(&:capitalize).each do |ingredient|
  allergen = Allergen.find_by_name("Shellfish")
  ingredient = Ingredient.find_or_create_by(name: ingredient)
  ingredient.allergens << allergen unless ingredient.allergens.include? allergen
  allergen.ingredients << ingredient unless allergen.ingredients.include? ingredient
end

#3 Seafood

[ 'abdone', 'cuttlefish', 'limpet', 'lapas', 'opihil', 'periwinkle', 'sea cucumber',
  'sea urchin', 'whelk', 'turban shell', 'caviar', 'fish flavoring', 'fish flour',
  'fish fume', 'fish gelatin', 'kosher gelatin', 'marine gelatin', 'fish oil',
  'fish sauce', 'imitation fish', 'isinglass', 'lutefisk maw', 'maws', 'fish maw',
  'fish stock', 'fishmeal', 'nuoc mam', 'roe', 'seafood flavoring', 'crab extract',
  'clam extract', 'shark cartilage', 'shark fin', 'surimi', 'sashimi', 'worcestershire sauce',
  'cuttlefish ink', 'fish stock', 'glucosamine', 'bouillabaisse', 'cod', 'flounder',
  'haddock', 'perch', 'salmon', 'tilapia', 'tuna', 'parvalbumin', 'anchovy', 'bass',
  'catfish', 'grouper', 'hake', 'halibut', 'herring', 'mahi mahi', 'pike', 'pollock',
  'snapper', 'sole', 'swordfish', 'trout', 'walleye'].map(&:capitalize).each do |ingredient|
  allergen = Allergen.find_by_name("Seafood")
  ingredient = Ingredient.find_or_create_by(name: ingredient)
  ingredient.allergens << allergen unless ingredient.allergens.include? allergen
  allergen.ingredients << ingredient unless allergen.ingredients.include? ingredient
end

# 4. Milk:

[ 'butter', 'butter fat', 'butter oil', 'butter acid', 'butter esters', 'buttermilk',
  'casein', 'casein hydrolysate', 'caseinates', 'cheese', 'cottage cheese',
  'cream', 'curds', 'custard', 'diacetyl ghee', 'half-and-half', 'lactalbumin',
  'lactalbumin phosphate', 'lactoferrin', 'lactose', 'lactulose', 'condensed milk',
  'derivative milk', 'dry milk', 'evaporated milk', 'goat"s milk', 'sheep milk',
  'lowfat milk', 'malted milk', 'milkfat', 'nonfat milk', 'powdered milk', 'protein milk',
  'skimmed milk', 'milk solid', 'whole milk', 'milk protein', 'hydrolysate', 'pudding',
  'Recaldent', 'rennet casein', 'sour cream', 'sour cream solid', 'sour milk solid',
  'tagatose', 'whey', 'whey protein hydrolysate', 'yogurt', 'chocolate', 'lactic acid starter',
  'hot dogs', 'sausages', 'margarine', 'nisin', 'nougat'].map(&:capitalize).each do |ingredient|
  allergen = Allergen.find_by_name("Milk")
  ingredient = Ingredient.find_or_create_by(name: ingredient)
  ingredient.allergens << allergen   unless ingredient.allergens.include? allergen
  allergen.ingredients << ingredient unless allergen.ingredients.include? ingredient
end

# 5.  Egg:
[ 'egg', 'albumin', 'albumen', 'dried egg', 'powdered egg', 'egg solid', 'white egg',
  'egg yolk', 'eggnog', 'globulin', 'livetin', 'lysozyme', 'mayonnaise', 'meringue',
  'meringue powder', 'surimi', 'vitellin', 'ovalbumin', 'turkey egg', 'goose egg',
  'quail egg', 'chicken egg', 'duck egg', 'ice cream', 'lecithin', 'marzipan',
  'marshmallow', 'nougat', 'pasta', 'meatload', 'meatballs'].map(&:capitalize).each do |ingredient|
  allergen = Allergen.find_by_name("Egg")
  ingredient = Ingredient.find_or_create_by(name: ingredient)
  ingredient.allergens << allergen   unless ingredient.allergens.include? allergen
  allergen.ingredients << ingredient unless allergen.ingredients.include? ingredient
end

# 6. Soy:
[ 'soy', 'edamame', 'miso', 'natto soy', 'soy albumin', 'soy cheese', 'soy fiber',
  'soy flour', 'soy grits', 'soy ice cream', 'soy milk', 'soy nuts', 'soy sprouts',
  'soy yogurt', 'soya soybean', 'curd', 'granules', 'soy protein concentrate',
  'hydrolyzed soy protein', 'soy protein isolate', 'shoyu', 'soy sauce', 'tamari',
  'tempeh', 'textured vegetable protein', 'tofu', 'vegetable gum', 'vegetable starch'].map(&:capitalize).each do |ingredient|
  allergen = Allergen.find_by_name("Soy")
  ingredient = Ingredient.find_or_create_by(name: ingredient)
  ingredient.allergens << allergen   unless ingredient.allergens.include? allergen
  allergen.ingredients << ingredient unless allergen.ingredients.include? ingredient
end

# 7. Gluten:
[ 'wheat', 'bread crumbs', 'bulgur', 'cereal extract', 'club wheat', 'couscous',
  'cracker meal', 'durum', 'einkorn', 'emmer', 'farina', 'all purpose flour',
  'bread flour', 'cake flour', 'durum flour', 'enriched flour', 'graham flour',
  'high gluten flour', 'high protein flour', 'instant flour', 'pastry flour',
  'self-rising flour', 'soft flour', 'wheat flour', 'steel ground flour', 'flour',
  'stone ground flour', 'whole wheat flour', 'hydrolyzed wheat protein', 'Kamut',
  'matzoh', 'matzoh meal', 'matzo', 'matzah', 'matza', 'pasta', 'seitan', 'semolina',
  'spelt', 'sprouted wheat', 'triticale', 'vital wheat gluten', 'wheat bran',
  'wheat durum', 'wheat germ', 'wheat gluten', 'wheatgrass', 'wheat malt',
  'wheat sprouts', 'wheat starch', 'wheat bran hydrolysate', 'wheat germ oil',
  'wheat grass', 'wheat protein isolate', 'whole wheat berries', 'glucose syrup',
  'oats', 'soy sauce', 'starch', 'gelatinized starch', 'modified starch',
  'modified food starch', 'vegetable starch', 'surimi', 'wheatberries', 'fu',
  'hydrolyzed wheat gluten', 'hydrolyzed wheat starch', 'hydroxypropyltrimonium hydrolyzed wheat protein',
  'dextrimaltose', 'disodium wheatgermamido peg-2 sulfosuccinate', 'wheat bran extract',
  'triticale', 'rye', 'barley', 'barley grass', 'barley malt', 'barley malt extract',
  'barley hordeum vulgare', 'gliadin', 'malt', 'malted barley flour', 'malted milk',
  'malted milkshake', 'malt extract', 'malt syrup', 'brewer yeast', 'barley syrup',
  'malt vinegar', 'beer', 'barley flavoring', 'barley grass', 'barley enzymes',
  'sprouted barley', 'pearl barley', 'rice malt', 'maltose', 'malt sugar', 'brown rice syrup',
  'oat flour', 'oat bran', 'oat gum', 'oatmeal', 'oats', 'rolled oats', 'oat flour',
  'rye bread', 'rye flour', 'rye grain', 'germ oil', 'germ extract'].map(&:capitalize).each do |ingredient|
  allergen = Allergen.find_by_name("Gluten")
  ingredient = Ingredient.find_or_create_by(name: ingredient)
  ingredient.allergens << allergen   unless ingredient.allergens.include? allergen
  allergen.ingredients << ingredient unless allergen.ingredients.include? ingredient
end

# 8 Wheat
[ 'wheat', 'bread crumbs', 'bulgur', 'cereal extract', 'club wheat', 'couscous',
  'cracker meal', 'durum', 'einkorn', 'emmer', 'farina', 'all purpose flour',
  'bread flour', 'cake flour', 'durum flour', 'enriched flour', 'graham flour',
  'high gluten flour', 'high protein flour', 'instant flour', 'pastry flour','self-rising flour',
  'soft flour', 'wheat flour', 'steel ground flour', 'flour',
  'stone ground flour', 'whole wheat flour', 'hydrolyzed wheat protein', 'Kamut',
  'matzoh', 'matzoh meal', 'matzo', 'matzah', 'matza', 'pasta', 'seitan', 'semolina',
  'spelt', 'sprouted wheat', 'triticale', 'vital wheat gluten', 'wheat bran',
  'wheat durum', 'wheat germ', 'wheat gluten', 'wheatgrass', 'wheat malt',
  'wheat sprouts', 'wheat starch', 'wheat bran hydrolysate', 'wheat germ oil',
  'wheat grass', 'wheat protein isolate', 'whole wheat berries', 'glucose syrup',
  'oats', 'soy sauce', 'starch', 'gelatinized starch', 'modified starch',
  'modified food starch', 'vegetable starch', 'surimi', 'wheatberries', 'fu',
  'hydrolyzed wheat gluten', 'hydrolyzed wheat starch', 'hydroxypropyltrimonium hydrolyzed wheat protein',
  'dextrimaltose', 'disodium wheatgermamido peg-2 sulfosuccinate', 'wheat bran extract',
  'triticale'].map(&:capitalize).each do |ingredient|
  allergen = Allergen.find_by_name("Wheat")
  ingredient = Ingredient.find_or_create_by(name: ingredient)
  ingredient.allergens << allergen   unless ingredient.allergens.include? allergen
  allergen.ingredients << ingredient unless allergen.ingredients.include? ingredient
end
