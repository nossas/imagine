Feature: edit a bad idea
  In order to a high quality level of my ideas
  As an ideator
  I want to edit a bad idea

  @omniauth_test
  Scenario: when I own the idea
    Given I'm logged in
    And I own an idea
    And I'm in "this idea page"
    And I click on edit idea
    And I fill in idea's title with "Edited idea"
    When I submit the edit idea form
    Then I should be in "this idea page"
    And I should see "Edited idea" on the idea's title

  @omniauth_test
  Scenario: when I don't own the idea
    Given I'm logged in
    And there is an idea
    When I'm in "this idea page"
    Then I should not see edit idea button

  Scenario: when I'm not logged in
    Given there is an idea
    When I'm in "this idea page"
    Then I should not see edit idea button

  @omniauth_test
  Scenario: when I'm an admin
    Given I'm a logged kickass admin
    And there is an idea
    And I'm in "this idea page"
    And I click on edit idea
    And I fill in idea's title with "Edited idea"
    When I submit the edit idea form
    Then I should be in "this idea page"
    And I should see "Edited idea" on the idea's title
