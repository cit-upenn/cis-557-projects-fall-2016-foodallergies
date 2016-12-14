Given(/^I'm on the add allergen page$/) do
	visit(new_allergen_path)
end

When(/^I add a nonexisted allergen to the database$/) do
	fill_in 'Name', :with => "Rex"
	click_button 'Create Allergen'
end

Then(/^I should be able to add an allergen$/) do
	# assert page.has_content?("Allergen was successfully created.")
	expect(page).to have_content ("Allergen was successfully created.")
end

When(/^I add a nonexisted allergen without a name to the database$/) do
	click_button 'Create Allergen'
end

Then(/^I should be able to see some errors on the page$/) do
	expect(page).to have_content("Name can't be blank")
end

When(/^I add an existing allergen to the database$/) do
	fill_in 'Name', :with => "Egg"
	click_button 'Create Allergen'
	visit("/allergens/new")
	fill_in 'Name', :with => "Egg"
	click_button 'Create Allergen'
end

Then(/^I should be able to see some errors for adding a duplicate$/) do
	expect(page).to have_content("Name has already been taken")
end

When(/^I add a new allergen whose first letter is not capitalized to the database$/) do
	fill_in 'Name', :with => "seafood"
	click_button 'Create Allergen'
end

Then(/^I should be able to see some errors for adding these bad format entry$/) do
	expect(page).to have_content("Name must start with upper case")
end
