Feature: Uninstall Preferences

  Scenario: Prefs already installed
    Given AppCode is installed
    And the Pivotal Preferences are already installed
    When I run:
      """
        ruby appcodeprefs uninstall
      """
    Then the Pivotal Preferences should be uninstalled
