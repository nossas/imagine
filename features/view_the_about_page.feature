Feature: view the about page
  In order to know the project
  As a visitor
  I want to view the about page
  
  Scenario:
    Given I'm in "the homepage"
    When I click in the about page link
    Then I should be in "the about page"
