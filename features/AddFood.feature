Feature: User in the Food Database page
	As a logged-in user
	I want to be able to add an nonexisting food to the database
	I want to edit an existing food
	I want to delete an existing food

	Scenario: Log in as an existing user with username
	Given I have set up the user database when testing food db
		 And I'm on the user sign in page when testing food db
	When I add an existing user with username and password when testing food db

Scenario: Add a food
	Given I'm on the add food page
	When I add a nonexistent food to the data base
	Then I should be able to add a food

Scenario: Add food without a name
	Given I'm on the add food page
	When I add a food without a name to the database
	Then I should see some errors on the food page

Scenario: Edit a food
	Given I click the edit button of one food
	When I change the name of the food
	Then I should be able to see the food with new name

Scenario: Delete a food
	Given I click the delete button of one food
	Then I should be able to see the food does not exist anymore

	Scenario: Add new food to the database with first letter no capitalized
		Given I'm on the add food page
		When I add a new food whose first letter is not capitalized to the database
		Then I should be able to see some errors for adding these bad format food

	Scenario: Add new food to the database with same product barcode
		Given I'm on the add food page
		When I add a new food whose barcode is identical to an existing food
		Then I should be able to see some error for adding duplicate barcode
