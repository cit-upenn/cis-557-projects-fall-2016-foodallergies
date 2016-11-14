Feature: User sign up page

  As a user
  So that I can log in 
  I want to sign up for Allergies Traker
	
	Scenario: Create a new user account
		Given I'm on the user sign up page
		When I add a new user
		Then show me the page
		Then I should be able to see the homepage

	Scenario: Add an user without email field
		Given I'm on the user sign up page
		When I add a new user without email field
		Then show me the page
		Then I can't create an user without email

	Scenario: Add an user when password does not match
		Given I'm on the user sign up page
		When I add a new user but password does not match
		Then show me the page
		Then I can't create an user when password does not match
