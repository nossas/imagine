Feature: vote for an idea
  In order to support an idea that I like
  As a visitor
  I want to vote for an idea

  @omniauth_test
  Scenario: when I'm logged in
    Given there is an idea
    And I'm in "this idea page"
    And I'm logged in
    When click to vote for this idea
    Then I should be in "this idea page"
    And I should have one vote for this idea
    And I should see the message of thanks for voting
  
  @omniauth_test
  Scenario: when I'm not logged in
    Given there is an idea
    And I'm in "this idea page"
    When click to vote for this idea
    Then I should be in "this idea page"
    And I should have one vote for this idea
    And I should see the message of thanks for voting

  @omniauth_test
  Scenario: when I already voted for this idea and I'm logged in
    Given there is an idea
    And I'm in "this idea page"
    And I'm logged in
    And I already voted for this idea
    When I'm in "this idea page"
    Then I should see you alredy voted for this idea