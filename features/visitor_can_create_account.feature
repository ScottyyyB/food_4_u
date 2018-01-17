Feature: Visitor can create an account
  As a visitor
  In order to register an account
  I need to be able to write in my user details and register

  Background:
    Given I visit the landing page

  Scenario: Visitor fill in all fields [Happy Path]
    And I click "Sign up"
    When I fill in "Email" with "hotmale@hotmail.com"
    And I fill in "Password" with "heythere12"
    And I fill in "Password confirmation" with "heythere12"
    And I click 'Sign up'
    Then I should be redirected to the "Landing" page
    And I should see "Welcome! You have signed up successfully."
