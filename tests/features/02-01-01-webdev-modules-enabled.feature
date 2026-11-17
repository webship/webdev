Feature: Web Development bundled modules are enabled
  As an admin user
  I want to verify that the Web Development recipe enables every bundled module
  So that I know the recipe ran cleanly during install

  Background:
    Given I am a logged in user with the "Webmaster" user

  Scenario: Modules report page lists Web Development as enabled
    Then the "webdev" module should be installed
     And the "ctools" module should be installed
     And the "token" module should be installed
     And the "diff" module should be installed
     And the "pathauto" module should be installed
     And the "metatag" module should be installed
     And the "field_group" module should be installed
     And the "smart_trim" module should be installed
     And the "entityqueue" module should be installed
     And the "inline_entity_form" module should be installed
     And the "better_exposed_filters" module should be installed
     And the "link_attributes" module should be installed
     And the "token_filter" module should be installed
