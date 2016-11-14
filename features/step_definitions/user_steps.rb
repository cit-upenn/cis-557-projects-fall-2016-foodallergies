Given (/^I'm on the user sign up page$/) do
	visit(new_user_session_path)
end

When (/^I add a new user$/) do
	fill_in 'Email', :with => "mary@seas.upenn.edu"
	fill_in 'Password', :with => "12345678"
	fill_in 'Password', :with => "12345678"
	click_button 'Sign up'
end

Then (/^I should be able to see the homepage$/) do
	assert page.has_content?("Welcome! You have signed up successfully.")
end

When (/^I add a new user without email field$/) do
	fill_in 'Password', :with => "12345678"
	fill_in 'Password', :with => "12345678"
	click_button 'Sign up'
end

Then (/^I can't create an user without email$/) do
	assert page.has_content?("Email can't be blank")
end