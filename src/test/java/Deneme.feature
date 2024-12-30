Feature: Penalty Management Tests

  Scenario: Create Penalty as Site Admin
    Given url baseUrl
    And path "/penalty-management/penalties"
    And header Authorization = 'Bearer ' + tokens.siteAdminToken
    And header Content-Type = "application/json"
    And request
    """
    {
        "plateNumber": "44MN5577",
        "penaltyNumber": "5",
        "penaltyAddress": "Baker St. No:221B London",
        "siteId": 1,
        "reason": "X",
        "penaltyFee": 100,
        "documents": ["https://example.com/documents/photo1.jpg"]
    }
    """
    When method post
    Then status 201
    And assert response.penaltyStatus == "CREATED"