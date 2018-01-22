Feature: Visitor can go to the order page to see a list of ordered products and the total price
  As a visitor
  In order to see what I ordered and the total price
  I would like to be able to see a list of all the ordered dishes and total price on the order page

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

    @gmap
  Scenario: Visitor can access order page to see a list of the ordered products and total price
    Given I visit the "ThaiTanic" page
    And I click on "Add to Order" for "Margherita"
    And I click on "Add to Order" for "Hawaii"
    And I click on "Checkout" link
    Then I should be redirected to the "Checkout" page
    And I should see "Ordered Items"
    And I should see "Margherita: 1 15.0 kr"
    And I should see "Hawaii: 1 14.0 kr"
    And I should see "Subtotal: 29.00 kr"
    And I should see "Delivery fee: 0.00 kr"
    And I should see "Total: 31.39 kr"