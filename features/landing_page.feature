Feature: Landing Page
  As a visitor
  In order to find food from a restaurant to order
  I would like to see a list of restaurants when I visit the landing page

  Background:
    Given the following restaurants exists
      | name            | description                                      |
      | ThaiTanic       | Thailands finest food, watch out for the iceburg |
      | Fu King Chinese | Best chinese food in town                        |


    And I visit the landing page

  @gmap
  Scenario: Visitor visits landing page
    Then I should see "Welcome to our site!"

  @gmap
  Scenario: Visitor can search for restaurants
    Then I should see "What do you feel like tonight?"
    And I should see "ThaiTanic"
    And I should see "Fu King Chinese"

  @gmap
  Scenario: Visitor can navigate to restaurant page
    When I click "ThaiTanic"
    Then I should be redirected to the "ThaiTanic" page
