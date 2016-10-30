Feature: User in the Allergen Database page
	As a logged-in user
	I want to be able to add an nonexisting allergen to the database

Scenario: Add an allergen
	Given I'm on the add allergen page
	When I add a nonexisted allergen to the database
	Then I should be able to add an allergen

Scenario: Add an allergen without a name
	Given I'm on the add allergen page
	When I add a nonexisted allergen without a name to the database
	Then show me the page
	Then I should be able to see some errors on the page