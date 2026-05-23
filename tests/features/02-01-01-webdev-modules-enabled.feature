Feature: Web Development bundled modules are enabled
  As an admin user
  I want to verify that the Web Development recipe enables every bundled module
  So that I know the recipe ran cleanly during install

  Background:
    Given I am a logged in user with the "Webmaster" user

  Scenario: Modules report page lists Web Development as enabled
    When I navigate to "/admin/modules"
    Then I should see "Web Development"
     And I should see "Chaos Tools"
     And I should see "Token"
     And I should see "Diff"
     And I should see "Pathauto"
     And I should see "Metatag"
     And I should see "Field Group"
     And I should see "Smart Trim"
     And I should see "Entityqueue"
     And I should see "Inline Entity Form"
     And I should see "Better Exposed Filters"
     And I should see "Link Attributes"
     And I should see "Token Filter"
