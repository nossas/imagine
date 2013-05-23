Feature: edit an update
  In order to fix an update
  As an admin
  I want to edit an update

  @omniauth_test @koala @javascript
  Scenario: when I'm a logged admin
    Given I'm a logged kickass admin
    And there is a problem
    And there is an update for this problem
    When I'm in "the updates page of this problem"
    Then I should see the edit update button
    When I click on the edit update button
    Then I should see the edit update form
    Given I fill in title with "Some random title"
    When I submit the edit update form
    Then I should see this update

  @koala
  Scenario: when I'm not a logged admin
    Given there is a problem
    And there is an update for this problem
    When I'm in "the updates page of this problem"
    Then I should not see the edit update button
