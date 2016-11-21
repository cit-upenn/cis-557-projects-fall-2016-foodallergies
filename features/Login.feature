Feature: User log in page
 
  As a registered user
  So that I can log in
  I want to log in for Allergies Traker

    Scenario: Log in as an existing user with username
		Given I have set up the user database
		   And I'm on the user sign in page
		When I add an existing user with username and password
		Then I should be able to see the homepage after logged in
		When click the sign out button
		Then I should be able to sign out and see sign up page

	Scenario: Log in as an existing user with email
		Given I have set up the user database
		   And I'm on the user sign in page
		When I add an existing user with email and password
		Then I should be able to see the homepage and success notice
