Feature: Visitor can login
  As a user
  In order to make it easier to place an order
  I need to be able to log in with my credentials and be able to logout

  Background:
    Given the following user exists
       | email                | password    | password_confirmation |
       | me@hotmail.com       | cutie123    | cutie123              |
    When I visit the landing page
    And I click "Log in"

  Scenario: Visitor fills in all fields [Happy Path]
    When I fill in "Email" with "me@hotmail.com"
    And I fill in "Password" with "cutie123"
    And I click "Log in"
    Then I should be redirected to the "Landing" page
    And I should see "Logged in as, me@hotmail.com"
    And I should see "Logout"
    And I should see "Signed in successfully."

  Scenario: Visitor does not fill in Email [Sad Path]
    When I fill in "Password" with "cutie123"
    And I click "Log in"
    Then I should see "Invalid Email or password."

  Scenario: Visitor does not fill in Password [Sad Path]
    When I fill in "Email" with "me@hotmail.com"
    And I click "Log in"
    Then I should see "Invalid Email or password."

  Scenario: Visitor does not fill in both fields [Sad Path]
    When I click "Log in"
    Then I should see "Invalid Email or password."
