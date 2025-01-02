Feature: Authentication for different roles

  Background:
    * def config = karate.call('classpath:karate-config.js')
    * url config.baseUrl
    * headers config.headers

  Scenario: Get All Tokens
    # Admin Token
    Given path '/gateway/gateway/admin/login'
    And request
    """
    {
      "username": "#(config.credentials.admin.username)",
      "password": "#(config.credentials.admin.password)"
    }
    """
    When method post
    Then status 200
    And match response.role == "ROLE_ADMIN"
    * def adminToken = response.token
    * print 'Admin Token:', adminToken

    # Site Admin Token
    Given path '/gateway/gateway/site-admin/login'
    And request
    """
    {
      "username": "#(config.credentials.siteAdmin.username)",
      "password": "#(config.credentials.siteAdmin.password)"
    }
    """
    When method post
    Then status 200
    And match response.role == "ROLE_SITE_ADMIN"
    * def siteAdminToken = response.token
    * print 'Site Admin Token:', siteAdminToken

    # Site Resident Token
    Given path '/gateway/gateway/resident/login'
    And request
    """
    {
      "username": "#(config.credentials.siteResident.username)",
      "password": "#(config.credentials.siteResident.password)"
    }
    """
    When method post
    Then status 200
    And match response.role == "ROLE_RESIDENT"
    * def siteResidentToken = response.token
    * print 'Site Resident Token:', siteResidentToken