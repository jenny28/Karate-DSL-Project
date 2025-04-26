Feature: Users

  Background:
    Given url mainURL
    * headers auth


  Scenario: Get users
    Given path "users",5777
    When method GET
    Then status 404

  Scenario:Delete users
    Given path "users",2666
    When method DELETE
    Then status 404


  Scenario: Update user
    * def requestUpdateUser = read("updateUser.json")

    Given path "users", 2666
    * request requestUpdateUser
    When method PUT
    Then status 404

  Scenario: Partial update user
    * def partialUpdateUser = read("partialUpdateUser.json")

    Given path "users", 26666
    * request partialUpdateUser
    When method PATCH
    Then status 404