Feature: User sign up page

  As a user
  So that I can sign up
  I want to sign up for Allergies Traker
	
	Scenario: Create a new user account
		Given I'm on the user sign up page
		When I try to add a new user
		Then I should be able to see the homepage after signed in

	Scenario: Add an user without username field
		Given I'm on the user sign up page
		When I add a new user without username field
		Then I can't create an user without username

	Scenario: Add an user without email field
		Given I'm on the user sign up page
		When I add a new user without email field
		Then I can't create an user without email

	Scenario: Set a username with email address
		Given I'm on the user sign up page
		When I try to fill the username field with an email address
		Then I can't create an user and cause some errors

	Scenario: Add an user when password does not match
		Given I'm on the user sign up page
		When I add a new user but password does not match
		Then I can't create an user when password does not match
