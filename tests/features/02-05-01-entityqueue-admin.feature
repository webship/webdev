Feature: Entityqueue admin pages
  As an admin user
  I want to manage Entity Queues
  So that I can curate ordered lists of content

  Background:
    Given I am a logged in user with the "Webmaster" user

  Scenario: Admin can open the Entity Queues list
    When I navigate to "/admin/structure/entityqueue"
    Then I should see "Entityqueues"
     And I should see "Add entity queue"

  Scenario: Admin can open the add entity queue form
    When I navigate to "/admin/structure/entityqueue/add"
    Then I should see the button "Save"
