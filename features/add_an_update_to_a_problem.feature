Feature: add an update to a problem
  In order to keep people updated about the problem
  As an admin
  I want to add an update to a problem

  @omniauth_test @javascript @koala
  Scenario: when I'm a logged admin
    Given I'm a logged kickass admin
    And there is a problem
    And I'm in "the updates page of this problem"
    And I click on add update button
    And I fill the update form
    When I submit the update form
    Then I should be in "the updates page of this problem"
    And I should see the new update
  
  @omniauth_test @javascript @koala
  Scenario: when there are errors in the form
    Given I'm a logged kickass admin
    And there is a problem
    And I'm in "the updates page of this problem"
    And I click on add update button
    When I submit the update form
    Then I should see errors for the update fields
 
  Scenario: when I'm not a logged admin
    Given there is a problem
    When I'm in "the updates page of this problem"
    Then I should not see add update button
