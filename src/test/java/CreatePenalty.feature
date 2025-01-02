Feature: Penalty Management Tests

  Background:
    * def config = karate.call('classpath:karate-config.js')
    * url config.baseUrl
    * headers config.headers
    * def TokenCreate = call read('TokenCreate.feature')
    * def siteAdminToken = TokenCreate.siteAdminToken

  Scenario: Create Penalty as Site Admin
    Given path '/penalty-management/penalties'
    And header Authorization = 'Bearer ' + siteAdminToken
    And request
    """
    {
        "plateNumber": "44MN5577",
        "penaltyNumber": "6",
        "penaltyAddress": "Baker St. No:221B London",
        "siteId": 1,
        "reason": "X",
        "penaltyFee": 100,
        "documents": ["https://example.com/documents/photo1.jpg"]
    }
    """
    When method post
    Then status 201
    And match response.penaltyStatus == "CREATED"
    * print 'Created Penalty Response:', response