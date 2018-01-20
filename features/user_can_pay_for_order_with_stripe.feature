@javascript
Feature: A User can pay for their order using stripe
  As a visitor
  In order to pay for my ordered products
  I would like to pay with my card in a secure way

  Scenario: User can fill in stripe form
    Given I visit the checkout page
    When I click "Pay with Card" button
    And I fill in stripe form field "Email" with "random@random.com"
    And I fill in stripe form field "Card number" with "4242 4242 4242 4242"
    And I fill in stripe form field "Expiry" with "12/2021"
    And I fill in stripe form field "CVC" with "123"
    And I submit the stripe form
    Then I should be on the "confirmation" page
    And I should see "Your transaction was successful!"

  Scenario: User fill in incorrect card number
    Given I visit the checkout page
    When I click "Pay with Card" button
    And I fill in stripe form field "Email" with "random@random.com"
    And I fill in stripe form field "Card number" with "4242 4242 4242 4241"
    And I fill in stripe form field "Expiry" with "12/2021"
    And I fill in stripe form field "CVC" with "123"
    And I submit the stripe form
    Then I should be on the "confirmation" page
    And I should not see "Your transaction was successful!"

  Scenario: Users card is expired
    Given I visit the checkout page
    When I click "Pay with Card" button
    And I fill in stripe form field "Email" with "cutie123@hotmail.com"
    And I fill in stripe form field "Card number" with "4000000000000069"
    And I fill in stripe form field "Expiry" with "12/2021"
    And I fill in stripe form field "CVC" with "123"
    Then I should be on the "confirmation" page
    And I should not see "Your transaction was successful!"

  Scenario: User fill in incorrect CVC number
    Given I visit the checkout page
    When I click "Pay with Card" button
    And I fill in stripe form field "Email" with "random@random.com"
    And I fill in stripe form field "Card number" with "4000 0000 0000 0127"
    And I fill in stripe form field "Expiry" with "12/2021"
    And I fill in stripe form field "CVC" with "123"
    Then I should be on the "confirmation" page
    And I should not see "Your transaction was successful!"

  Scenario: Users card is declined
    Given I visit the checkout page
    When I click "Pay with Card" button
    And I fill in stripe form field "Email" with "cutie123@hotmail.com"
    And I fill in stripe form field "Card number" with "4000000000000002"
    And I fill in stripe form field "Expiry" with "12/2021"
    And I fill in stripe form field "CVC" with "123"
    Then I should be on the "confirmation" page
    And I should not see "Your transaction was successful!"

  Scenario: Processing error
    Given I visit the checkout page
    When I click "Pay with Card" button
    And I fill in stripe form field "Email" with "random@random.com"
    And I fill in stripe form field "Card number" with "4000000000000119"
    And I fill in stripe form field "Expiry" with "12/2021"
    And I fill in stripe form field "CVC" with "123"
    And I submit the stripe form
    Then I should be on the "confirmation" page
    And I should not see "Your transaction was successful!"