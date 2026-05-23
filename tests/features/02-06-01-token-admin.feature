Feature: Token and Token Filter integration
  As an admin user
  I want Token and Token Filter to be available
  So that I can embed dynamic tokens in content and configuration

  Background:
    Given I am a logged in user with the "Webmaster" user

  Scenario: The available tokens help page lists token groups
    When I navigate to "/admin/help/token"
    Then I should see "Tokens"

  Scenario: Token Filter is offered as a text format filter
    When I navigate to "/admin/config/content/formats/manage/basic_html"
    Then I should see "Replaces global and entity tokens with their values"
