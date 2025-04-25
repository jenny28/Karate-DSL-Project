Feature: Users

  Background:
    Given url mainURL

  Scenario:
    Given path "auth","users"
    When method GET
    Then status 200
    * assert responseTime < 1000

  Scenario: Get users
    Given path "auth", "users",5
    When method GET
    Then status 200
    * assert responseTime < 1000

  Scenario:Delete users
    Given path "auth", "users",2
    When method DELETE
    Then status 200
    * assert responseTime < 1000

  Scenario:Sort users
    Given path "auth", "users"
    * params {"sortBy": "age", "order": "desc"}
    When method GET
    Then status 200
    * assert responseTime < 1000

  Scenario:Filter users
    Given path "auth", "users" , "filter"
    * params {"key": 'address.city',"value": 'Phoenix'}
    When method GET
    Then status 200
    * assert responseTime < 1000

  Scenario: Create user
    * def requestCreateUser = read("createUser.json")

    Given path "auth","users", "add"
    * request requestCreateUser
    When method POST
    Then status 201
    * assert responseTime < 1000

  Scenario: Update user
    * def requestUpdateUser = read("updateUser.json")

    Given path "auth","users", 2
    * request requestUpdateUser
    When method PUT
    Then status 200
    * assert responseTime < 1000

  Scenario: Partial update user
    * def partialUpdateUser = read("partialUpdateUser.json")

    Given path "auth","users", 2
    * request partialUpdateUser
    When method PATCH
    Then status 200
    * assert responseTime < 1000