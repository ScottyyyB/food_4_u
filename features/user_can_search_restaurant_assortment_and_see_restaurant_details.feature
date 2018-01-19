@gmap
Feature: visitor search for restaurant assortment
  As a visitor
  In order to get suggestion for a restaurant
  I would like to be able to enter a keyword to find an assortment of restaurants to select from

  Background:
    Given the following restaurants exists
      | name            | description                                      | assortment |
      | ThaiTanic       | Thailands finest food, watch out for the iceberg | Thai       |

    And I visit the landing page

  Scenario: Visitor can search for restaurants and navigate to a specific restaurant [Happy path]
    And I fill in "search" with "Thai"
    And I click "Search"
    And I click "ThaiTanic"
    Then I should be redirected to the "ThaiTanic" page
    And I should see "Thailands finest food, watch out for the iceberg"

  Scenario: Visitor input wrong keywords [Sad path]
    And I fill in "search" with "Gandalf"
    And I click "Search"
    Then I should see "No restaurants found."
