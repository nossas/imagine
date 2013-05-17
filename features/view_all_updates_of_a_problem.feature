Feature: view all updates of a problem
  In order to keep me updated on the problem
  As a visitor
  I want to view all updates of a problem

  Scenario: when there is no update
    Given there is a problem
    And I'm in "this problem page"
    When I click on the updates button
    Then I should see no updates yet

  Scenario: when there is an update
    Given there is an update
    And I'm in "the problem page of this update"
    When I click on the updates button
    Then I should see this update
