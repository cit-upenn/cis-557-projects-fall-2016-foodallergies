Given(/^I'm on the weight creation page$/) do
	visit(new_weight_path)
end

When(/^I try to add a new daily weight$/) do
	fill_in 'Weight', :with => "50"
	click_button 'Create Weight'
end

Then(/^I should be able to see the weight record page$/) do
	expect(page).to have_content("Weight was successfully created.")
end

When(/^I try to add a new daily weight without weight$/) do
	click_button 'Create Weight'
end

Then(/^I should see some errors on the weight page$/) do
	expect(page).to have_content("Weight can't be blank")
end

When(/^I try to add a new daily weight with a date field$/) do
	fill_in 'Weight', :with => "50"
	select_date("2016-01-01", :from => "Date")
	click_button 'Create Weight'
end

When(/^I try to add a new daily weight whose number is smaller than zero$/) do
	fill_in 'Weight', :with => "-10"
	click_button 'Create Weight'
end

Then(/^I should be able to see some format errors$/) do
	expect(page).to have_content("Weight must be greater than 0")
end
