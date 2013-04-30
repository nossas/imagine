Feature: accept a contribution to my idea
  In order to improve my idea
  As an ideator
  I want to accept a contribution to my idea

  @omniauth_test
  Scenario: when I'm logged in
    Given I'm logged in
    And I have some pending contributions
    And I'm in "the pending contributions page"
    When I accept the pending contribution
    Then I should be in "the pending contributions page"
    And the contribution should be accepted
