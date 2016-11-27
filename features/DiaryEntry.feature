Feature: Diary_entry page

  As a logged-in user
  So that I can track my diary
  I want to add a new entry to the diary
  
  
  Scenario: Add a diary entry
    Given I have logged in
    Given I'm on the diary entry creation page
    
    When I try to add a new diary entry
    Then I should be able to see the new diary entry's page
    
  Scenario: Add an diary entry without a food name
    Given I'm on the diary entry creation page
    When I try to add a new diary entry without a food name
    Then show me the page
    Then I should see some errors saying food cant be blank on the page

  Scenario: Edit an exisiting diary entry
  	Given I'm on the diary entry creation page
    When I try to add a new diary entry
    Then show me the page
    When I click edit the page
    Then show me the page
    When I try to change the entry values
    Then I should see the entry has been updated

  Scenario: Add a diary entry with datetime & meal type
    Given I'm on the diary entry creation page
    When I try to add a new diary entry with date and meal
    Then I should be able to see the new diary entry's page

  Scenario: Abort editing an exisiting diary entry
    Given I'm on the diary entry creation page
    When I try to add a new diary entry
    Then show me the page
    When I click edit the page
    Then show me the page
    When I try to abort editing and go back to the diary
    Then I should see the diary page