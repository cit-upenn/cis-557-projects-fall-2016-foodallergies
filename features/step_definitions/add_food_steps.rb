Given(/^I'm on the add food page$/) do
	visit("/foods/new")
end

When(/^I add a nonexistent food to the data base$/) do
	fill_in 'Name', :with => "Chips"
	click_button 'Create Food'
end

Then(/^I should be able to add a food$/) do
	assert page.has_content?("Food was successfully created.")
end

When(/^I add a food without a name to the database$/) do
	click_button 'Create Food'
end

Then(/^I should see some errors on the food page$/) do
	assert page.has_content?("Name can't be blank")
end

When(/^I add a new food whose first letter is not capitalized to the database$/) do
	fill_in 'Name', :with => "truffle"
	click_button 'Create Food'
end

Then(/^I should be able to see some errors for adding these bad format food$/) do
	assert page.has_content?("Name must start with upper case")
end

# When(/^I add a new food whose barcode is identical to an existing food$/) do
# 	fill_in 'Name', :with => "truffle"
# 	fill_in 'Product barcode', :with => 1111
# 	click_button 'Create Food'
# 	visit("/foods/new")
# 	fill_in 'Name', :with => "chicken"
# 	fill_in 'Product barcode', :with => 1111
# 	click_button 'Create Food'
# end
#
# Then(/^I should be able to see some error for adding duplicate barcode$/) do
# 	assert page.has_content?("Product barcode has already been taken")
# end

Given(/^I click the edit button of one food$/) do
	visit("/foods/new")
	fill_in 'Name', :with => "Chips"
	click_button 'Create Food'
	visit("/foods/1/edit")
end

When(/^I change the name of the food$/) do
	fill_in 'Name', :with => "Cucumber"
	click_button 'Update Food'
end

Then(/^I should be able to see the food with new name$/) do
	assert page.has_content?("Cucumber")
end
