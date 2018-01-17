Feature: Visitor can create an account
  As a visitor
  In order to register an account
  I need to be able to write in my user details and register

  Background:
    Given I visit the landing page

  Scenario: Visitor fills in all fields [Happy Path]
    And I click "Sign up"
    When I fill in "Email" with "hotmale@hotmail.com"
    And I fill in "Password" with "heythere12"
    And I fill in "Password confirmation" with "heythere12"
    And I click 'Sign up'
    Then I should be redirected to the "Landing" page
    And I should see "Welcome! You have signed up successfully."

  Scenario: Visitor fills in all fields except Email [Sad Path]
    And I click "Sign up"
    When I fill in "Password" with "heythere12"
    And I fill in "Password confirmation" with "heythere12"
    And I click 'Sign up'
    Then I should see "1 error prohibited this user from being saved: Email can't be blank"

  Scenario: Visitor fills in all fields except Password [Sad Path]
    And I click "Sign up"
    When I fill in "Email" with "hotmale@hotmail.com"
    And I fill in "Password confirmation" with "heythere12"
    And I click 'Sign up'
    Then I should see "2 errors prohibited this user from being saved: Password can't be blankPassword confirmation doesn't match Password"

  Scenario: Visitor fills in all fields except Password confirmation [Sad Path]
    And I click "Sign up"
    When I fill in "Email" with "hotmale@hotmail.com"
    And I fill in "Password" with "heythere12"
    And I click 'Sign up'
    Then I should see "1 error prohibited this user from being saved: Password confirmation doesn't match Password"
