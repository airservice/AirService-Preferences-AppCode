Feature: Install Preferences

  Scenario: AppCode installed but Preferences not previously installed
    Given AppCode is installed
    And the Pivotal Preferences are not already installed
    When I run:
      """
        ruby appcodeprefs install
      """
    Then the Pivotal Preferences should be installed and take effect when I start AppCode
