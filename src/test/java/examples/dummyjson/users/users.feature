Feature: Users

  Scenario:
    Given url mainURL
    * path "users"
    When method GET

  Scenario: Get users
    Given url mainURL
    * path "users",5
    When method GET

  Scenario:Delete users
    Given url mainURL
    * path "users",2
    When method DELETE

  Scenario:Sort users
    Given url mainURL
    * path "users"
    * param sortBy = 'age'
    * param order = 'desc'
    When method GET

  Scenario:Filter users
    Given url mainURL
    * path "users" , "filter"
    * param key = 'address.city'
    * param key = 'Phoenix'
    When method GET