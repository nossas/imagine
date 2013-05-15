Feature: remove a problem
  In order to keep only good problems live
  As an admin
  I want to remove a problem

  @omniauth_test
  Scenario: when I'm a logged admin
    Given I'm a logged kickass admin
    And there is a problem
    And I'm in "this problem page"
    When I click on remove problem button
    Then I should be in "the problems page"
    And I should see a successful message

  @omniauth_test
  Scenario: when I'm not a logged admin
    Given I'm logged in
    And there is a problem
    When I'm in "this problem page"
    Then I should not see the remove problem button
