Feature: Products

  Background:
    Given url mainURL
    # * headers auth

  Scenario: As user I want to have all products so that i can see the detail of them
    Given path "products"
    When method GET
    Then status 401

  Scenario: Get product
    Given path "products",2
    When method GET
    Then status 401


  Scenario:Delete product
    Given path "products",2
    When method DELETE
    Then status 401


  Scenario:Sort product
    Given path "products"
    * params {"sortBy": "price", "order": "asc"}
    When method GET
    Then status 401


  Scenario:Search product
    Given path "products" , "search"
    * param q = 'kitchen'
    When method GET
    Then status 401


  Scenario: Create product
    * def requestBody = read ("createProduct.json")

    Given path "products","add"
    * request requestBody
    When method POST
    Then status 401


  Scenario: Update product
    * def updateProductRequest = read ("updateProduct.json")

    Given path "products", 2
    * request updateProductRequest
    When method PUT
    Then status 401


  Scenario: Partial update product
    * def requestPartialUpdate = read("partialUpdateProduct.json")

    Given path "products", 2
    * request requestPartialUpdate
    When method PATCH
    Then status 401


