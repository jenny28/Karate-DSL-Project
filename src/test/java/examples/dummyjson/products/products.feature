Feature: Products

  Background:
    Given url mainURL

  Scenario: As user I want to have all products so that i can see the detail of them
    Given path "products"
    When method GET

  Scenario: Get product
    Given path "products",2
    When method GET

  Scenario:Delete product
    Given path "products",2
    When method DELETE

  Scenario:Sort product
    Given path "products"
    * param sortBy = 'price'
    * param order = 'asc'
    When method GET
    Then status 200

  Scenario:Search product
    Given path "products" , "search"
    * param q = 'kitchen'
    When method GET