Feature: Users

  Background:
    Given url mainURL
    * headers auth

  Scenario:
    Given path "users"
    When method GET
    Then status 200
    * assert responseTime < 1000

  Scenario: Get users
    Given path "users",5
    When method GET
    Then status 200
    * assert responseTime < 1000
    * assert response.id == 5
    * assert response.firstName == "Emma"
    * assert response.age == 30
    * assert response.bank.cardType == "American Express"
    * assert response.company.address.state == "Idaho"

  Scenario:Delete users
    Given path "users",2
    When method DELETE
    Then status 200
    * assert responseTime < 1000

  Scenario:Sort users
    Given path "users"
    * params {"sortBy": "age", "order": "desc"}
    When method GET
    Then status 200
    * assert responseTime < 1000

  Scenario:Filter users
    Given path "users" , "filter"
    * params {"key": 'address.city',"value": 'Phoenix'}
    When method GET
    Then status 200
    * assert responseTime < 1000

  Scenario: Create user
    * def requestCreateUser = read("createUser.json")

    Given path "users", "add"
    * request requestCreateUser
    When method POST
    Then status 201
    * assert responseTime < 1000

  Scenario: Update user
    * def requestUpdateUser = read("updateUser.json")

    Given path "users", 2
    * request requestUpdateUser
    When method PUT
    Then status 200
    * assert responseTime < 1000

  Scenario: Partial update user
    * def partialUpdateUser = read("partialUpdateUser.json")

    Given path "users", 2
    * request partialUpdateUser
    When method PATCH
    Then status 200
    * assert responseTime < 1000