Feature: Visitor can see total price in the navbar
  As a visitor
  In order to keep track of the total amount of my order
  I would like the navbar checkout icon to be updated with the total price

  Background:
    Given the following restaurants exists
      | name            | description                                      |
      | ThaiTanic       | Thailands finest food, watch out for the iceberg |

    And the following menus exist for "ThaiTanic"
      | name    |
      | Lunch   |

    And the following product categories exist for "Lunch"
      | name    |
      | Pizza   |

    And the following products exist for "Pizza"
      | name       | price  |
      | Margherita | 15     |
      | Hawaii     | 14     |

    Scenario: Visitor can add a selected product to an order
      Given I visit the "ThaiTanic" page
      When I click on "Add to Order" for "Margherita"
      Then I should see 15 in the navbar
      And I click on "Add to Order" for "Hawaii"
      Then I should see 24 in the navbar
