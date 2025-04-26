Feature:Autorization

  Background: Precondicion
    Given url "https://dummyjson.com/auth"

  Scenario: Login
    * def LoginPayload = read("classpath:examples/dummyjson/auth/login.json")

    Given path "login"
    * request LoginPayload
    When method POST
    Then status 200
    * def token = response.accessToken
