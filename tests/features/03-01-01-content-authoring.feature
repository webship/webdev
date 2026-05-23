Feature: Authoring content with the bundled Web Development modules
  As a content editor
  I want to create articles using the bundled modules
  So that Pathauto, the URL alias widget and revisioning work end to end

  Background:
    Given I am a logged in user with the "Webmaster" user

  Scenario: The article form exposes the core URL alias controls
    When I navigate to "/node/add/article"
    Then I should see "Create Article"
     And I should see "URL alias"

  Scenario: An article can be created and viewed
    When I navigate to "/node/add/article"
     And I fill in the "Title" field with "Web Development sample article"
     And I click the "Save" button
    Then I should see "Web Development sample article"
     And I should see "Article Web Development sample article has been created"

  Scenario: Pathauto generates a clean URL alias for a new article
    When I navigate to "/node/add/article"
     And I fill in the "Title" field with "Web Development Pathauto Article"
     And I click the "Save" button
    Then I should see "Article Web Development Pathauto Article has been created"
    When I navigate to "/web-development-pathauto-article"
    Then I should see "Web Development Pathauto Article"
