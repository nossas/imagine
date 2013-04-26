Feature: create an idea for a problem
  In order to contribute to a problem
  As an ideator
  I want to create an idea for a problem

  @omniauth_test
  Scenario: when I'm logged in
    Given I'm logged in
    And there is a problem
    And I'm in "this problem page"
    And I click on the new idea button
    And I fill the form for the new idea
    When I submit the new idea form
    Then I should be in "the new idea page"
    And I should be invited to share my new idea
  
  @omniauth_test
  Scenario: when I'm not logged in
    Given there is a problem
    And I'm in "this problem page"
    And I click on the new idea button
    And I fill the form for the new idea
    When I submit the new idea form
    Then I should be in "the new idea page"
    And I should be invited to share my new idea
  
  @omniauth_test @javascript
  Scenario: when I don't fill the form correctly
    Given I'm logged in
    And there is a problem
    And I'm in "this problem page"
    And I click on the new idea button
    When I submit the new idea form
    Then I should see the error messages for idea

  @omniauth_test @javascript
  Scenario: when the problem is closed for contributions
    Given I'm logged in
    And there is a problem with a expired contribution deadline
    When I'm in "this problem page"
    Then I should not see the new idea link
