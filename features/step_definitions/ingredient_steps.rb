Given(/^I'm on the add ingredient page$/) do
	visit(new_ingredient_path)
end

When(/^I add a nonexistent ingredient to the database$/) do
	fill_in 'Name', :with => "Trinitrotolune"
	click_button 'Create Ingredient'
end

Then(/^I should be able to add an ingredient$/) do
	expect(page).to have_content("Ingredient was successfully created.")
end

When(/^I add a nonexistent ingredient without a name to the database$/) do
	click_button 'Create Ingredient'
end

Then(/^I should be able to see some errors on the ingredient page$/) do
	expect(page).to have_content("Name can't be blank")
end

When(/^I add an existing ingredient to the database$/) do
	fill_in 'Name', :with => "Trinitrotolune"
	click_button 'Create Ingredient'
	visit("/ingredients/new")
	fill_in 'Name', :with => "Trinitrotolune"
	click_button 'Create Ingredient'
end

Then(/^I should be able to see some errors for adding a duplicate ingredient$/) do
	expect(page).to have_content("Name has already been taken")
end

When(/^I add a new ingredient whose first letter is not capitalized to the database$/) do
	fill_in 'Name', :with => "dimethybenzene"
	click_button 'Create Ingredient'
end

Then(/^I should be able to see some errors for adding these bad format ingredient$/) do
	expect(page).to have_content("Name must start with upper case")
end
