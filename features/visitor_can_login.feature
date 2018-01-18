Feature: Visitor can login
  As a user
  In order to access my account
  I need to be able to log in with my credentials

  Background:
    Given the following user exists
      | email         | password    | password_confirmation |
      | hey@test.com  | heythere12  | heythere12            |

    And I visit the landing page
    And I click "Login"

    Scenario: Visitor can navigate to login page
      Then I should be redirected to the "Login" page

  Scenario: Visitor logs with valid credentials [Happy Path]
    When I fill in "Email" with "hey@test.com"
    And I fill in "Password" with "heythere12"
    And I fill in "Password confirmation" with "heythere12"
    And I click 'Log in'
    Then I should be redirected to the "Landing" page
    And I should see "Welcome back! Signed in successfully"
