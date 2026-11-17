Feature: Comparing content revisions with Diff
  As a content editor
  I want to compare two revisions of a basic page
  So that I can review what changed between versions

  Background:
    Given I am a logged in user with the "Webmaster" user

  Scenario: A second revision adds the Diff comparison controls
    When I navigate to "/node/add/page"
     And I fill in the "Title" field with "Diff revision page"
     And I save the content
    Then I should see "Diff revision page"
    When I edit the content item I created
     And I fill in the "Title" field with "Diff revision page version two"
     And I save the content
    Then I should see "Diff revision page version two"
    When I open the revisions of the content item I am viewing
    Then I should see "Revisions"
     And I should see "Compare selected revisions"
    When I delete the content item I created
    Then I should see "has been deleted"
