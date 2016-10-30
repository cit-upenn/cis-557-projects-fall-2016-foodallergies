Given(/^I'm on the add allergen page$/) do
	visit(new_allergen_path)
end

When(/^I add a nonexisted allergen to the database$/) do
	fill_in 'Name', :with => "Egg"
	click_button 'Create Allergen'
end

Then(/^I should be able to add an allergen$/) do 
	assert page.has_content?("Allergen was successfully created.")
end

When(/^I add a nonexisted allergen without a name to the database$/) do 
	click_button 'Create Allergen'
end

Then(/^I should be able to see some errors on the page$/) do 
	assert page.has_content?("Name can't be blank")
end