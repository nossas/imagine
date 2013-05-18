Feature: view an update of a problem
  In order to keep me updated on a problem
  As a visitor
  I want to view an update of a problem

  @javascript
  Scenario: when there is an update for a problem
    Given there is an update
    And I'm in "the problem page of this update"
    And I click on the updates button
    When I click on the update
    Then I should see the update in a lightbox
