Feature: Diff admin pages
  As an admin user
  I want to manage the Diff comparison settings
  So that content editors can compare node revisions

  Background:
    Given I am a logged in user with the "Webmaster" user

  Scenario: Admin can open the Diff general settings
    When I navigate to "/admin/config/content/diff/general"
    Then I should see "Diff"
     And I should see the button "Save configuration"

  Scenario: Admin can open the Diff field type settings
    When I navigate to "/admin/config/content/diff/fields"
    Then I should see "Field type"
