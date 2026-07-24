Feature: Field Group on manage form display
  As an admin user
  I want Field Group to add grouping controls to the form display
  So that I can organise content entry forms into tabs and fieldsets

  Background:
    Given I am a logged in user with the "Webmaster" user

  Scenario: Article manage form display offers the Add field group control
    When I navigate to "/admin/structure/types/manage/article/form-display"
    Then I should see "Manage form display"
     And I should see "Add field group"

  Scenario: Article manage display offers the Add field group control
    # Drupal 11.4 turned "/display" into a view-modes overview page (Default,
    # RSS, Teaser, ...); the field/group editing UI now lives one level
    # deeper, at "/display/default".
    When I navigate to "/admin/structure/types/manage/article/display/default"
    Then I should see "Add field group"
