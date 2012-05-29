Feature: Listing projects
  As a user
  I Want to see the list of projects
  So I can choose one to see the details

  Scenario: List all projects
    Given I'm logged in
    And   I have some projects loaded
    When  I browse all the projects
    Then  I should see the complete list of projects