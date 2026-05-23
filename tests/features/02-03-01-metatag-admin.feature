Feature: Metatag admin pages
  As an admin user
  I want to manage Metatag defaults
  So that nodes expose the right meta tags to search engines and crawlers

  Background:
    Given I am a logged in user with the "Webmaster" user

  Scenario: Admin can open the Metatag settings list
    When I navigate to "/admin/config/search/metatag"
    Then I should see "Metatag"
     And I should see "Add default meta tags"

  Scenario: Admin can open the global metatag default
    When I navigate to "/admin/config/search/metatag/global"
    Then I should see the button "Save"
