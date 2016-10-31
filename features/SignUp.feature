Feature: User sign up page

  As a user
  So that I can log in 
  I want to sign up for Allergies Traker
	
	Scenario: Add an username
		Given I'm on the user sign up page
		When I add a new user
		Then I should be able to see the userpage with user signing in

	Scenario: Add an user without username
		Given I'm on the user sign up page
		When I add a new user without username
		Then show me the page
		Then I can't create an user without username

	Scenario: Add an user without email
		Given I'm on the user sign up page
		When I add a new user without email
		Then I can't create an user without email