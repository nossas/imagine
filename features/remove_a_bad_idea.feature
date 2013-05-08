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

  @omniauth_test
  Scenario: when I don't own the idea
    Given I'm logged in
    And there is an idea
    When I'm in "this idea page"
    Then I should not see remove idea button

  Scenario: when I'm not logged in
    Given there is an idea
    When I'm in "this idea page"
    Then I should not see remove idea button

  @omniauth_test
  Scenario: when I'm an admin
    Given I'm a logged kickass admin
    And there is an idea
    And I'm in "this idea page"
    When I click on remove idea
    Then I should be in "the idea's problem page"
    And I should see a successful message
