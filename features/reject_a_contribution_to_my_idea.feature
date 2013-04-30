Feature: reject a contribution to my idea
  In order to clean my pending contributions list
  As an ideator
  I want to reject a contribution to my idea

  @omniauth_test
  Scenario: when I'm logged in
    Given I'm logged in
    And I have some pending contributions
    And I'm in "the pending contributions page"
    When I reject the pending contribution
    Then I should be in "the pending contributions page"
    And the contribution should be rejected
