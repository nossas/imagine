Feature: edit a problem
  In order to change my mistake
  As an admin
  I want to edit a problem

  @omniauth_test
  Scenario: when I'm a logged admin
    Given I'm a logged kickass admin
    And I've created a problem
    And I'm in "this problem page"
    And I click on the edit problem button
    And I change the problem's title to "Death star"
    When I submit the edit problem form
    Then I should be in "this problem page"
    And the problem's title should be "Death star"
