Feature: view all ideas for a problem
  In order to vote or colaborate for an idea
  As a visitor
  I want to view all ideas for a problem

  Scenario: when there is an idea
    Given there is a problem
    And there is an idea for this problem
    When I'm in "this problem page"
    Then I should see that idea
