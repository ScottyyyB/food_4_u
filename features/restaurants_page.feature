Feature:
  As a visitor
  In order to see the info about a specific restaurant
  I would like to be able to see the restaurant name and description

  Background:
    Given the following restaurants exists
    | name            | description                                      |
    | ThaiTanic       | Thailands finest food, watch out for the iceburg |
    | Fu King Chinese | Best chinese food in town                        |

  Scenario: Visitor visits the restaurant page
    Given I visit the "ThaiTanic" page
    Then I should see "ThaiTanic"
    And I should see "Thailands finest food, watch out for the iceburg"
