Feature: Access control for Web Development admin pages
  As a site administrator
  I want module configuration pages to be protected
  So that only privileged users can change site-building configuration

  Scenario: Anonymous user cannot access the Pathauto patterns
    Given I am an anonymous user
    When I navigate to "/admin/config/search/path/patterns"
    Then I should see "Access denied"

  Scenario: Anonymous user cannot access the Metatag config
    Given I am an anonymous user
    When I navigate to "/admin/config/search/metatag"
    Then I should see "Access denied"

  Scenario: Anonymous user cannot access the Entity Queues admin
    Given I am an anonymous user
    When I navigate to "/admin/structure/entityqueue"
    Then I should see "Access denied"

  Scenario: Authenticated user cannot access the Pathauto patterns
    Given I am a logged in user with the "Authenticated user" user
    When I navigate to "/admin/config/search/path/patterns"
    Then I should see "Access denied"
