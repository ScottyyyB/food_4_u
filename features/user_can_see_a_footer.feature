Feature: Footer
  As a user
  In order to see information about the site
  I would like to see info about the platform company in the footer

  Scenario: Display footer to visitor
    Given I visit the landing page
    Then the "footer" should be visible
    And I should see "Kitchen to Couch™"
