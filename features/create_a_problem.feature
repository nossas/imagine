Feature: create a problem
  In order to collect good ideas to solve a problem
  As a admin
  I want to create a problem

  @omniauth_test
  Scenario: when I'm an admin
    Given I'm a logged kickass admin
    And I'm in "the homepage"
    And I click on the new problem button
    And I fill the problem form
    When I submit the problem form
    Then I should be in "the new problem page"
  
  @omniauth_test
  Scenario: when I'm not an admin
    Given I'm logged in
    When I'm in "the homepage"
    Then I should not see the new problem button
