Feature: Selection of restaurants displayed on a map
  As a visitor
  In order to visualise how many restaurants I can choose
  I would like to see them displayed on a map

  Background:
    Given the following restaurants exists
      | name            | description                     | street_address    | post_code | city          |
      | ThaiTanic       | Thailands finest food           | Kungsgatan 25     | 11156     | Stockholm     |
      | ChinaTown       | Best chinese food in town       | Hamngatan 1       | 11147     | Stockholm     |
      | PizzaPlace      | Very nice pizza                 | Hantverksgatan 28 | 11221     | Stockholm     |

    @javascript
    Scenario: Visitor sees restaurants on map
      Given I visit the landing page
      And the map has been loaded
      Then I should see "3" markers
