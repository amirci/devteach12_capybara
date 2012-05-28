Feature: Mark a project as active
  As a manager
  I want to activate a project
  So I can start working on it

  Scenario: Activate project
    Given I'm logged in
    And   I have a project called "Sharepoint++"
    When  I activate the project
    Then  the project should be shown active in the listing