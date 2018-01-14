Feature: Visitor can view details about a specific restaurant
  As a visitor
  In order to see the info about a specific restaurant
  I would like to be able to see the restaurant name and description

  Background:
    Given the following restaurants exists
    | name            | description                                      |
    | ThaiTanic       | Thailands finest food, watch out for the iceberg |
    | Fu King Chinese | Best chinese food in town                        |

  Scenario: Visitor visits a specific restaurant page
    Given I visit the landing page
    When I click "ThaiTanic"
    Then I should be redirected to the "ThaiTanic" page
    And I should see "ThaiTanic"
    And I should see "Thailands finest food, watch out for the iceberg"
    And I should see "Menu 1"
    And I should see "Menu 2"
