Given(/^I'm on the diary entry creation page$/) do
	visit(new_diary_entry_path)
end

When(/^I try to add a new diary entry$/) do
	fill_in 'Food', :with => "Ramen"
	fill_in 'Amount', :with => "500"
	click_button 'Add Diary entry'
end

Then(/^I should be able to see the new diary entry's page$/) do 
	assert page.has_content?("Diary entry was successfully created.")
end


When(/^I try to add a new diary entry without a food name$/) do
	fill_in 'Amount', :with => "500"
	click_button 'Add Diary entry'
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


# Scenario 4

When(/^I try to add a new diary entry with date and meal$/) do
	select_datetime("2016-01-01 10:00", :from => "Time")
	find("option[value='Lunch']").click
	fill_in 'Food', :with => "Ramen"
	fill_in 'Amount', :with => "500"
	click_button 'Create Diary entry'
end

# Scenario 5
When(/^I try to abort editing and go back to the diary$/) do
	click_link 'Back'
end

Then(/^I should see the diary page$/) do 
	assert page.has_content?("My Food Diary")
end