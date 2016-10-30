Given (/^I'm on the user sign up page$/) do
	visit(new_user_path)
end

When (/^I add a new user$/) do
	fill_in 'Name', :with => "Tom"
	fill_in 'Email', :with => "tom@seas.upenn.edu"
	click_button 'Create User'
end

Then (/^I should be able to see the userpage with user signing in$/) do
	assert page.has_content?("User was successfully created.")
end

When (/^I add a new user without username$/) do
	fill_in 'Email', :with => "tom@seas.upenn.edu"
	click_button 'Create User'
end

Then (/^I can't create an user without username$/) do
	assert page.has_content?("Name can't be blank")
end

When (/^I add a new user without email$/) do
	fill_in 'Name', :with => "Tom"
	click_button 'Create User'
end

Then (/^I can't create an user without email$/) do
	assert page.has_content?("Email can't be blank")
end