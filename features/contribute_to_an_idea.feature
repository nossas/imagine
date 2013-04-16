Feature: contribute to an idea
  In order to improve an existing idea
  As a contributor
  I want to contribute to an idea

  @omniauth_test @javascript
  Scenario: when I'm logged in
    Given I'm logged in
    And there is an idea
    And I'm in "this idea page"
    And I fill the contribution form
    When I submit the contribution form
    Then I should be in "this idea page"
    And I should be warned to wait for the idea's owner approval
