Feature: Products displayed for visitors
  As a visitor
  In order to help me decide what product to order
  I would like to see products displayed

  Background:
    Given the following restaurants exists
      | name            | description                                      |
      | ThaiTanic       | Thailands finest food, watch out for the iceberg |
      | Fu King Chinese | Best chinese food in town                        |

    And the following menus exist for "ThaiTanic"
      | name    |
      | Lunch   |
      | Dinner  |

    And the following product categories exist for "Lunch"
      | name    |
      | Pizza   |
      | Noodles |

    And the following products exist for "Pizza"
      | name       | price  |
      | Margherita | 15     |
      | Hawaii     | 14     |

  Scenario: Visitor can see restaurant content
    Given I visit the "ThaiTanic" page
    Then I should see 'Lunch'
    And I should see 'Pizza'
    And I should see 'Margherita Price: 15'
    And I should see 'Hawaii Price: 14'
    Then show me the page
