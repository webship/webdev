Feature: Pathauto admin pages
  As an admin user
  I want to manage Pathauto URL alias patterns
  So that nodes and terms get clean, readable URLs

  Background:
    Given I am a logged in user with the "Webmaster" user

  Scenario: Admin can open the Pathauto patterns list
    When I navigate to "/admin/config/search/path/patterns"
    Then I should see "Pathauto"
     And I should see "Patterns"
     And I should see "Add Pathauto pattern"

  Scenario: Admin can open the Pathauto settings tab
    When I navigate to "/admin/config/search/path/settings"
    Then I should see "Settings"
     And I should see the button "Save configuration"
