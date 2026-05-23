Feature: Better Exposed Filters in the Views UI
  As an admin user
  I want Better Exposed Filters to be available in the Views UI
  So that I can render exposed filters as rich widgets

  Background:
    Given I am a logged in user with the "Webmaster" user

  Scenario: The Views administration listing is reachable
    When I navigate to "/admin/structure/views"
    Then I should see "Views"
     And I should see "Add view"

  Scenario: Better Exposed Filters is offered as an exposed form style
    When I navigate to "/admin/structure/views/nojs/display/content/page_1/exposed_form"
    Then I should see "Better Exposed Filters"
