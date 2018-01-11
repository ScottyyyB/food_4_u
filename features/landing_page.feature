Feature: Landing Page
  As a visitor
  In order to find food from a restaurant to order
  I would like to see a list of restaurants when I visit the landing page

  Scenario: Visitor visits landing page
    Given I visit the 'Landing' page
    Then I should see 'Welcome to our site!'
