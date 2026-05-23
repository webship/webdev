Feature: Metatag output on the front end
  As a site visitor
  I want pages to expose canonical and core meta tags
  So that crawlers and browsers receive correct page metadata

  Scenario: The front page exposes a canonical link
    Given I am an anonymous user
    When I navigate to "/"
    Then the page link rel "canonical" should exist

  Scenario: The front page exposes the Drupal generator meta tag
    Given I am an anonymous user
    When I navigate to "/"
    Then the page meta "name" "Generator" should exist
