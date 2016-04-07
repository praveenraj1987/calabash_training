Feature: Sample Feature

  Scenario: User login with correct credentials
    Given the app has launched
    When I login with following credential on login page
      | username | password |
      | kuldeep  | 1234     |
    Then I should be on First Screen
    And It Should have Description
    When I Navigate to Next Screen
    Then I should be on Second Screen
    When I Navigate back
    Then I should be on First Screen
    When I Navigate back
    Then I should be on Login Screen



  Scenario: User login with incorrect credentials
    Given the app has launched
    When I login with following credential on login page
      | username     | password |
      | random_user  | 123456   |
    Then I should see a login error dialog
    When I dismiss the error dialog
    Then I should be on Login Screen
