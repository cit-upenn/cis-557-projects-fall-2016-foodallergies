Feature: User in the Food Database page
	As a logged-in user
	I want to be able to add an nonexisting food to the database
	I want to edit an existing food
	I want to delete an existing food

Scenario: Add a food
	Given I'm on the add food page
	When I add a nonexisted food to the data base
	Then I should be able to add a food

Scenario: Add food without a name
	Given I'm on the add food page
	When I add a food without a name to the database
	Then show me the page
	Then I should see some errors on the page

Scenario: Edit a food
	Given I click the edit button of one food
	When I change the name of the food
	Then I should be able to see the food with new name

Scenario: Delete a food
	Given I click the delete button of one food
	Then I should be able to see the food does not exist anymore