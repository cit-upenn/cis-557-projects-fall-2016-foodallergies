Given (/^I'm on the user sign up page$/) do
	visit(new_user_registration_path)
end

When (/^I add a new user$/) do
	fill_in 'Email', :with => "mary@seas.upenn.edu"
	fill_in 'Password', :with => "12345678"
	fill_in 'Password confirmation', :with => "12345678"
	click_button 'Sign up'
end

Then (/^I should be able to see the homepage$/) do
	assert page.has_content?("Welcome!")
end

When (/^I add a new user without email field$/) do
	fill_in 'Password', :with => "12345678"
	fill_in 'Password confirmation', :with => "12345678"
	click_button 'Sign up'
end

Then (/^I can't create an user without email$/) do
	assert page.has_content?("Email can't be blank")
end

When (/^I add a new user but password does not match$/) do
	fill_in 'Email', :with => "mary@seas.upenn.edu"
	fill_in 'Password', :with => "12345678"
	fill_in 'Password confirmation', :with => "1234"
	click_button 'Sign up'
end

Then (/^I can't create an user when password does not match$/) do
	assert page.has_content?("Password confirmation doesn't match Password")
end