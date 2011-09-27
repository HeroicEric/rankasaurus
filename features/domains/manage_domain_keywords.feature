Feature: Manage domain keywords

  As a user
  I need to be able to CRUD keywords
  So that I can find my domain's ranking for each keyword

  Scenario: List keywords on domain show page
    Given the following domain exists:
      | name      | url                  |
      | Telrepco  | http://telrepco.com  |
    And the following keywords exist for "Telrepco":
      | term                 |
      | panasonic toughbooks |
      | gargoyles            |
      | gorilla suits        |
    When I am on the show domain page for "Telrepco"
    Then I should see "panasonic toughbooks"
    And I should see "gargoyles"
    And I should see "gorilla suits"
  
  Scenario: Delete a keyword
    Given the following domain exists:
      | name      | url                  |
      | Telrepco  | http://telrepco.com  |
    And the following keywords exist for "Telrepco":
      | term                 |
      | panasonic toughbooks |
      | gargoyles            |
      | gorilla suits        |
    When I am on the show domain page for "Telrepco"
    And I follow "Delete" for "Telrepco" keyword "gargoyles" 
    Then I should see "Keyword deleted successfully."
    And I should be on the show domain page for "Telrepco"
    And I should not see "gargoyles"