Feature: login
  In order to colaborate with an idea
  As a visitor
  I want to login

  @omniauth_test
  Scenario: when the login is succeeded
    Given there is a problem
    And I'm in "this problem page"
    When I click on "the Facebook login button"
    Then I should be logged in
    And I should be in "this problem page"
