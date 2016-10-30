Feature: User in the Food Database page
	As a logged-in user
	I want to be able to add an nonexisting food to the database
	I want to edit an existing food
	I want to delete an existing food

Scenario: Add a food
	Given I'm on the add food page
	When I add a nonexisted food to the data base
	Then I should be able to add it