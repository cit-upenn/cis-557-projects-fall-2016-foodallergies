Given(/^I'm on the add food page$/) do
	visit(new_food_path)
end

When(/^I add a nonexisted food to the data base$/) do
	fill_in 'Name', :with => "Chips"
	click_button 'Create Food'
end

Then(/^I should be able to add a food$/) do 
	assert page.has_content?("Food was successfully created.")
end

When(/^I add a food without a name to the database$/) do 
	click_button 'Create Food'
end

Then(/^I should see some errors on the page$/) do 
	assert page.has_content?("Name can't be blank")
end