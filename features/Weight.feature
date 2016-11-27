Feature: User in the Weight page
	
	As a logged-in user
	So that I can track my daily weight
	I want to add a daily weight record

Scenario: Add a weight record
	Given I have logged in
	Given I'm on the weight creation page
	When I try to add a new daily weight
	Then I should be able to see the weight record page

Scenario: Add a weight record without a weight
	Given I have logged in
	Given I'm on the weight creation page
	When I try to add a new daily weight without weight
	Then I should see some errors on the weight page

Scenario: Add a weight record with date field
	Given I have logged in
	Given I'm on the weight creation page
	When I try to add a new daily weight with a date field
	Then I should be able to see the weight record page

Scenario: Add a weight record with weight number smaller than zero
	Given I have logged in
	Given I'm on the weight creation page
	When I try to add a new daily weight whose number is smaller than zero
	Then I should be able to see some format errors
