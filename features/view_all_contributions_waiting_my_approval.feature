Feature: view all contributions waiting my approval
  In order to manage my contributions
  As an ideator
  I want to view all contributions waiting my approval

  @omniauth_test
  Scenario: when there is no contribution waiting my approval
    Given I'm logged in
    When I click on the contributions link
    Then I should see no pending contributions
