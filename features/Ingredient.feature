Feature: User in the Ingredient Database page
	As a logged-in user
	I want to be able to add an nonexistent ingredient to the database

  Scenario: Add an ingredient
  	Given I'm on the add ingredient page
  	When I add a nonexistent ingredient to the database
  	Then I should be able to add an ingredient

  Scenario: Add an ingredient without a name
  	Given I'm on the add ingredient page
  	When I add a nonexistent ingredient without a name to the database
  	Then I should be able to see some errors on the ingredient page

  Scenario: Add an existing ingredient to the database
  	Given I'm on the add ingredient page
  	When I add an existing ingredient to the database
  	Then I should be able to see some errors for adding a duplicate ingredient

  Scenario: Add new ingredient to the database with first letter no capitalized
  	Given I'm on the add ingredient page
  	When I add a new ingredient whose first letter is not capitalized to the database
  	Then I should be able to see some errors for adding these bad format ingredient
