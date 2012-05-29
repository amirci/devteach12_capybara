Feature: Delete a project
  As a Manager
  I want to delete a project
  So I can remove finished projects
  
  @javascript
  Scenario: Delete project
    Given I have a project called "Sharepoint++" 
    When  I delete the project
    Then  I should not see the project in the listing