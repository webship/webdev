Feature: Comparing content revisions with Diff
  As a content editor
  I want to compare two revisions of an article
  So that I can review what changed between versions

  Background:
    Given I am a logged in user with the "Webmaster" user

  Scenario: A second revision adds the Diff comparison controls
    When I navigate to "/node/add/article"
     And I fill in the "Title" field with "Diff revision article"
     And I click the "Save" button
    Then I should see "Diff revision article"
    When I click the "Edit" link
     And I fill in the "Title" field with "Diff revision article version two"
     And I click the "Save" button
    Then I should see "Diff revision article version two"
    When I click the "Revisions" link
    Then I should see "Revisions"
     And I should see "Compare selected revisions"
