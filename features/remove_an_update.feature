Feature: remove an update
  In order to keep only the good updates
  As an admin
  I want to remove an update

  @omniauth_test @koala
  Scenario: when I'm a logged admin
    Given I'm a logged kickass admin
    And there is a problem
    And there is an update for this problem
    When I'm in "the updates page of this problem"
    Then I should see the update with a trash button
    When I click on the trash button
    Then I should be in "the updates page of this problem"
    And I should not see the update anymore

  @koala
  Scenario: when I'm not a logged admin
    Given there is a problem
    And there is an update for this problem
    When I'm in "the updates page of this problem"
    Then I should not see the update with a trash button
