Feature: Landing Page
  As a visitor
  In order to find food from a restaurant to order
  I would like to see a list of restaurants when I visit the landing page

  Background:
    Given I visit the landing page

  Scenario: Visitor visits landing page
    Then I should see "Welcome to our site!"

  Scenario: Visitor can search for restaurants
    Then I should see "What do you feel like tonight?"
    And I should see "ThaiTanic"
    And I should see "Fu King Chinese"
