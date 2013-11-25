Feature: view all my pending contributions
  In order to manage my contributions
  As an ideator
  I want to view all my pending contributions

  @omniauth_test
  Scenario: when there is no pending contributions
    Given I'm logged in
    When I'm in "the pending contributions page"
    Then I should see no pending contributions

  @omniauth_test
  Scenario: when there is pending contributions
    Given I'm logged in
    And I have some pending contributions
    When I'm in "the pending contributions page"
    Then I should see these contributions
