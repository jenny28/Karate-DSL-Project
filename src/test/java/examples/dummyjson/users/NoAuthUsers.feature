Feature: Users

  Background:
    Given url mainURL
    # * headers auth


  Scenario: Get users
    Given path "users",5
    When method GET
    Then status 401

  Scenario:Delete users
    Given path "users",5
    When method DELETE
    Then status 401


  Scenario: Update user
    * def requestUpdateUser = read("updateUser.json")

    Given path "users", 5
    * request requestUpdateUser
    When method PUT
    Then status 401

  Scenario: Partial update user
    * def partialUpdateUser = read("partialUpdateUser.json")

    Given path "users", 5
    * request partialUpdateUser
    When method PATCH
    Then status 401