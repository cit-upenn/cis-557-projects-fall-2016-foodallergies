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
	Then I should be able to see some errors on the page

Scenario: Add an existing allergen to the database
	Given I'm on the add allergen page
	When I add an existing allergen to the database
	Then I should be able to see some errors for adding a duplicate

Scenario: Add new allergen to the database with first letter no capitalized
	Given I'm on the add allergen page
	When I add a new allergen whose first letter is not capitalized to the database
	Then I should be able to see some errors for adding these bad format entry
