Feature: Add domain keyword

    As a user
    I should be able to add new keywords to a domain
    So that I can track the rank of those keywords
    
    Scenario: Successfully add keyword from show domain page
      Given the following domain exists:
        | name      | url                  |
        | Telrepco  | http://telrepco.com  |
      And I am on the show domain page for "Telrepco"
      When I follow "New keyword"
      Then I should be on the new keyword page for "Telrepco"
      And I fill in "Term" with "toughbook touchscreen repair"
      And I press "Save"
      Then I should be on the show domain page for "Telrepco"
      And I should see "Keyword added successfully."

    Scenario: Cancel adding keyword
      Given the domain "Telrepco" exists with no keywords
      When I am on the new keyword page for "Telrepco"
      And I fill in "Term" with "toughbook"
      And I follow "Cancel"
      Then I should be on the show domain page for "Telrepco"
      And I should not see "toughbook"