Given (/^I have set up the user database when testing food db$/) do
	User.create(
		username: "yg",
		email: "yg@seas.upenn.edu",
		password: "12345678",
		password_confirmation: "12345678")
end

Given (/^I'm on the user sign in page when testing food db$/) do
	visit(new_user_session_path)
end

When (/^I add an existing user with username and password when testing food db$/) do
	fill_in 'Login', :with => "yg"
	fill_in 'Password', :with => "12345678"
	click_button 'Log in'
end

Given(/^I'm on the add food page$/) do
	visit("/foods/new")
	User.create(
		username: "yg",
		email: "yg@seas.upenn.edu",
		password: "12345678",
		password_confirmation: "12345678")
	visit(new_user_session_path)
	fill_in 'Login', :with => "yg"
	fill_in 'Password', :with => "12345678"
	click_button 'Log in'
	visit("/foods/new")
end

When(/^I add a nonexistent food to the data base$/) do
	fill_in 'Name', :with => "Chips"
	click_button 'Create Food'
end

Then(/^I should be able to add a food$/) do
	expect(page).to have_content("Food was successfully created.")
end

When(/^I add a food without a name to the database$/) do
	click_button 'Create Food'
end

Then(/^I should see some errors on the food page$/) do
	expect(page).to have_content("Name can't be blank")
end

When(/^I add a new food whose first letter is not capitalized to the database$/) do
	fill_in 'Name', :with => "truffle"
	click_button 'Create Food'
end

Then(/^I should be able to see some errors for adding these bad format food$/) do
	expect(page).to have_content("Name must start with upper case")
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
	User.create(
		username: "yg",
		email: "yg@seas.upenn.edu",
		password: "12345678",
		password_confirmation: "12345678")
	visit(new_user_session_path)
	fill_in 'Login', :with => "yg"
	fill_in 'Password', :with => "12345678"
	click_button 'Log in'
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
	expect(page).to have_content("Cucumber")
end
