Feature: Restaurant page reviews
  As a user
  In order to select the best restaurant and also express my opinion
  I would like to see reviews about the restaurant and be able to add a review

  Background:
    Given the following user exists
      | email         | password      | password_confirmation |
      | me@gmail.com  | cutie123      | cutie123              |
    And the following restaurants exist
      | name            | description                                      |
      | ThaiTanic       | Thailands finest food, watch out for the iceberg |
      | Fu King Chinese | Best chinese food in town                        |
    And I visit the "ThaiTanic" page

  Scenario: User adds review [Happy Path]
    And I am logged in as "me@gmail.com"
    
