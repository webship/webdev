Feature: Authoring content with the bundled Web Development modules
  As a content editor
  I want to create basic pages using the bundled modules
  So that Pathauto, the URL alias widget and revisioning work end to end

  Background:
    Given I am a logged in user with the "Webmaster" user

  Scenario: The basic page form exposes the core URL alias controls
    When I navigate to "/node/add/page"
    Then I should see "Create Basic page"
     And I should see "URL alias"

  Scenario: A basic page can be created and viewed
    When I navigate to "/node/add/page"
     And I fill in the "Title" field with "Web Development sample page"
     And I save the content
    Then I should see "Web Development sample page"
     And I should see "Basic page Web Development sample page has been created"
    When I delete the content item I created
    Then I should see "has been deleted"

  Scenario: Pathauto generates a clean URL alias for a new basic page
    When I navigate to "/node/add/page"
     And I fill in the "Title" field with "Web Development Pathauto Page"
     And I save the content
    Then I should see "Basic page Web Development Pathauto Page has been created"
    When I navigate to "/web-development-pathauto-page"
    Then I should see "Web Development Pathauto Page"
    When I delete the content item I created
    Then I should see "has been deleted"
