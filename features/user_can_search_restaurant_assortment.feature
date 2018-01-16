Feature: visitor search for restaurant assortment
  As a visitor
  In order to get suggestion for a restaurant
  I would like to be able to enter a keyword to find an assortment of restaurants to select from

  Background:
    Given the following restaurants exists
      | name            | description                                      | assortment |
      | ThaiTanic       | Thailands finest food, watch out for the iceberg | Thai       |
      | Fu King Chinese | Best chinese food in town                        | Asian      |

    And I visit the landing page

  Scenario: Visitor can search for restaurants
    And I fill in "Restaurant Assortment" with "Thai"
    And I click "Search"
    Then I should see "ThaiTanic"
