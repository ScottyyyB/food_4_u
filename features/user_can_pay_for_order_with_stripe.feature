@javascript
Feature: A User can pay for their order using stripe
  As a visitor
  In order to pay for my ordered products
  I would like to pay with my card in a secure way

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

    And I visit the "ThaiTanic" page

    Given the following order items exist in an order:
      | name       |
      | Margherita |

    And I visit the checkout page

  Scenario: User can fill in stripe form
    When I click "Pay with Card" button
    And I fill in stripe form field "Email" with "random@random.com"
    And I fill in stripe form field "Card number" with "4242 4242 4242 4242"
    And I fill in stripe form field "Expiry" with "12/2021"
    And I fill in stripe form field "CVC" with "123"
    And I submit the stripe form
    Then I should be on the "confirmation" page
    And I should see "Your transaction was successful!"

  Scenario: User fill in incorrect card number
    When I click "Pay with Card" button
    And I fill in stripe form field "Email" with "random@random.com"
    And I fill in stripe form field "Card number" with "4242 4242 4242 4241"
    And I fill in stripe form field "Expiry" with "12/2021"
    And I fill in stripe form field "CVC" with "123"
    And I submit the stripe form
    Then I should be on the "checkout" page
    And I should not see "Your transaction was successful!"

  Scenario: Users card is expired
    When I click "Pay with Card" button
    And I fill in stripe form field "Email" with "cutie123@hotmail.com"
    And I fill in stripe form field "Card number" with "4000000000000069"
    And I fill in stripe form field "Expiry" with "12/2021"
    And I fill in stripe form field "CVC" with "123"
    Then I should be on the "checkout" page
    And I should not see "Your transaction was successful!"

  Scenario: User fill in incorrect CVC number
    When I click "Pay with Card" button
    And I fill in stripe form field "Email" with "random@random.com"
    And I fill in stripe form field "Card number" with "4000 0000 0000 0127"
    And I fill in stripe form field "Expiry" with "12/2021"
    And I fill in stripe form field "CVC" with "123"
    Then I should be on the "checkout" page
    And I should not see "Your transaction was successful!"

  Scenario: Users card is declined
    When I click "Pay with Card" button
    And I fill in stripe form field "Email" with "cutie123@hotmail.com"
    And I fill in stripe form field "Card number" with "4000000000000002"
    And I fill in stripe form field "Expiry" with "12/2021"
    And I fill in stripe form field "CVC" with "123"
    Then I should be on the "checkout" page
    And I should not see "Your transaction was successful!"

  Scenario: Processing error
    When I click "Pay with Card" button
    And I fill in stripe form field "Email" with "random@random.com"
    And I fill in stripe form field "Card number" with "4000000000000119"
    And I fill in stripe form field "Expiry" with "12/2021"
    And I fill in stripe form field "CVC" with "123"
    And I submit the stripe form
    Then I should be on the "checkout" page
    And I should not see "Your transaction was successful!"