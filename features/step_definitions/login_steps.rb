Given (/^I have set up the user database$/) do
	User.create(
		username: "yg",
		email: "yg@seas.upenn.edu",
		password: "12345678",
		password_confirmation: "12345678")
end

Given (/^I'm on the user sign in page$/) do
	visit(new_user_session_path)
end

When (/^I add an existing user with username and password$/) do
	fill_in 'Login', :with => "yg"
	fill_in 'Password', :with => "12345678"
	click_button 'Log in'
end

Then (/^I should be able to see the succesful notice$/) do
	expect(page).to have_content("Signed in successfully.")
end

When (/^I add an existing user with email and password$/) do
	fill_in 'Login', :with => "yg@seas.upenn.edu"
	fill_in 'Password', :with => "12345678"
	click_button 'Log in'
end

Then (/^I should also be able to see the success notice$/) do
	expect(page).to have_content("Signed in successfully.")
end

When (/^click the sign out button$/) do
	click_link 'Signout'
end

Then (/^I should be able to sign out and see sign up page$/) do
	expect(page).to have_content("You need to sign in or sign up before continuing.")
end

Given (/^I have logged in$/) do
	User.create(
		username: "yg",
		email: "yg@seas.upenn.edu",
		password: "12345678",
		password_confirmation: "12345678")
	visit(new_user_session_path)
	fill_in 'Login', :with => "yg"
	fill_in 'Password', :with => "12345678"
	click_button 'Log in'
end