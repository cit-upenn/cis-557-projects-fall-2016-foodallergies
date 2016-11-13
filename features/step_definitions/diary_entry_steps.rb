Given(/^I have logged in$/) do
	visit(new_diary_entry_path)
	click_link 'Sign up'
	fill_in 'Email', :with => 'aaa@aaa.com'
	fill_in 'Password', :with => '11111111'
	fill_in 'Password confirmation', :with => 'Password confirmation'
	click_button 'Sign up'
end

Given(/^I'm on the diary entry creation page$/) do
	visit(new_diary_entry_path)
end

When(/^I try to add a new diary entry$/) do
	fill_in 'Food', :with => "Ramen"
	fill_in 'Amount', :with => "500"
	click_button 'Create Diary entry'
end

Then(/^I should be able to see the new diary entry's page$/) do 
	assert page.has_content?("Diary entry was successfully created.")
end


When(/^I try to add a new diary entry without a food name$/) do
	fill_in 'Amount', :with => "500"
	click_button 'Create Diary entry'
end

Then(/^I should see some errors saying food cant be blank on the page$/) do 
	assert page.has_content?("Food can't be blank")
end

When(/^I click edit the page$/) do
	click_link 'Edit'
end

When(/^I try to change the entry values$/) do
	fill_in 'Food', :with => "Sushi"
	fill_in 'Amount', :with => "450"
	click_button 'Update Diary entry'
end

Then(/^I should see the entry has been updated$/) do 
	assert page.has_content?("Diary entry was successfully updated.")
end