Feature: Manage Domains

  As a user
  I want to be able to CRUD domains
  So that I can keep track of their rankings in the SERPS

  Scenario: Create a new domain
    Given I am on the domains page
    When I follow "Add domain"
    And I fill in "Name" with "Telrepco"
    And I fill in "Url" with "http://telrepco.com"
    And I press "Save"
    Then I should see "Domain was added successfully."
    And I should be on the show domain page for "Telrepco"

  Scenario: Cancel creating a domain
    Given I am on the domains page
    And no domains exist
    When I follow "Add domain"
    And I fill in "Name" with "Telrepco"
    And I fill in "Url" with "http://telrepco.com"
    And I follow "Cancel"
    Then I should be on the domains page

  Scenario: View domains list
    Given the following domains exist:
      | name      | url                  |
      | Telrepco  | http://telrepco.com  |
      | Buytough  | http://buytough.com  |
      | Panasonic | http://panasonic.com |
    When I go to the domains page
    Then I should see "Telrepco"
    And I should see "Buytough"
    And I should see "Panasonic"
    
  Scenario: View domain from domains list
    Given the following domains exist:
      | name      | url                  |
      | Telrepco  | http://telrepco.com  |
      | Buytough  | http://buytough.com  |
      | Panasonic | http://panasonic.com |
    And I am on the domains page
    When I follow "View" for domain "Telrepco"
    Then I should be on the show domain page for "Telrepco"
    And I should see "Telrepco"
    
  Scenario: Edit a domain from the domains list
    Given the following domains exist:
      | name      | url                  |
      | Telrepco  | http://telrepco.com  |
      | Buytough  | http://buytough.com  |
      | Panasonic | http://panasonic.com |
    And I am on the domains page
    When I follow "Edit" for domain "Telrepco"
    Then I should be on the edit domain page for "Telrepco"
    Then I fill in "Name" with "Simba"
    And I fill in "Url" with "http://priderock.com"
    And I press "Save"
    Then I should see "Domain was saved successfully."
    And I should be on the show domain page for "Simba"
    And I should see "Simba"
    And I should see "http://priderock.com"

  Scenario: Edit a domain from domain show page
    Given the following domain exists:
      | name      | url                  |
      | Telrepco  | http://telrepco.com  |
    When I am on the show domain page for "Telrepco"
    And I follow "Edit this domain"
    Then I should be on the edit domain page for "Telrepco"
    Then I fill in "Name" with "Simba"
    And I fill in "Url" with "http://priderock.com"
    And I press "Save"
    Then I should see "Domain was saved successfully."
    And I should be on the show domain page for "Simba"
    And I should see "Simba"
    And I should see "http://priderock.com"

  Scenario: Delete a domain
    Given the following domain exists:
      | name      | url                  |
      | Telrepco  | http://telrepco.com  |
    When I am on the domains page
    And I follow "Delete" for domain "Telrepco"
    Then I should see "Domain was deleted successfully."
    And I should be on the domains page

  