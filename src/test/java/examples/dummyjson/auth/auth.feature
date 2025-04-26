Feature:Autorization

  Background: Precondicion
    Given url mainURL

  Scenario: Login
    * def LoginPayload = read ("login.json")

    Given path "login"
    * request LoginPayload
    When method POST
    Then status 200
    * assert responseTime < 1500
    * assert response.id == 1
    * assert response.firstName == "Emily"
    * assert response.lastName == "Johnson"
    * assert response.accessToken.length == 360
    * assert response.refreshToken.length == 360
    * def schema = read("schema.json")
    * match response == schema

  Scenario: Invalid login
    * def requestBody =
      """
      {
        "username": "emilys44",
        "password": "emilyspass44",
         "expiresInMins": 30
      }
      """
    Given path "login"
    * request requestBody
    When method POST
    Then status 400
    * assert response.message == "Invalid credentials"