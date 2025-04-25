Feature:Autorization

  Scenario: Login
    * def LoginPayload = read ("login.json")

    Given url mainURL
    * path "auth", "login"
    * request LoginPayload
    When method POST
    Then status 200
    * assert responseTime < 1500