Feature: view all problems
  In order to chose a problem to collaborate
  As a visitor
  I want to view all problems

  Scenario: when there are some problems
    Given there are some problems
    When I'm in "the homepage"
    Then I should see all the problems
