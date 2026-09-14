Feature: UI Suite and Display Builder site building
  As an admin user
  I want the UI Patterns library and the Display Builder profiles to be available
  So that I can build displays with components after the Web Development recipe

  Background:
    Given I am a logged in user with the "Webmaster" user

  Scenario: The UI Patterns library page loads
    When I navigate to "/admin/appearance/ui/components"
    Then I should see "Components"

  Scenario: The Display Builder UI list page lists the default profile
    When I navigate to "/admin/structure/display-builder"
    Then I should see "Display builder"
     And I should see "Default"
