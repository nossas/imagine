Feature: remove a bad idea
  In order to a high quality level of my ideas
  As an ideator
  I want to remove a bad idea

  @omniauth_test
  Scenario: when I own the idea
    Given I'm logged in
    And I own an idea
    And I'm in "this idea page"
    When I click on remove idea
    Then I should be in "the idea's problem page"
    And I should see a successful message

  Scenario: when I don't own the idea
  Scenario: when I'm not logged in
  Scenario: when I'm an admin
