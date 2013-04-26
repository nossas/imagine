Feature: preview my new idea
  In order to create an awesome idea
  As an ideator
  I want to preview my new idea

  @omniauth_test @javascript
  Scenario: when I fill the idea's form correctly
    Given I'm logged in
    And there is a problem
    And I'm in "the new idea page for this problem"
    When I fill the form for the new idea
    Then I should see the preview of my new idea
