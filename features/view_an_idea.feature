Feature: view an idea
  In order to collaborate with an idea
  As a visitor
  I want to view an idea

  Scenario: 
    Given there is a problem
    And there is an idea for this problem
    And I'm in "this problem page"
    When I click on the idea
    Then I should be in "this idea page"
