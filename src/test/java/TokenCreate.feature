Feature: Authentication for different roles

  Background:
    * def config = read('classpath:C:\Users\mates\IdeaProjects\PMSAPITEST\src\test\resources\karate-config.js')
    * def baseUrl = config.baseUrl
    * def credentials = config.credentials
    * def headers = { "Content-Type": "application/json" }

  Scenario: Get All Tokens
    # Admin Token

    Given url baseUrl
    And path "gateway/gateway/admin/login"
    And header Content-Type = 'application/json'
    And request
    """
    {
      "username": "#(credentials.admin.username)",
      "password": "#(credentials.admin.password)"
    }
    """
    When method post
    Then status 200
    And match response.role == "ROLE_ADMIN"
    * def adminToken = response.token

    # Site Admin Token
    Given url baseUrl
    And path "gateway/gateway/site-admin/login"
    And header Content-Type = 'application/json'
    And request
    """
    {
      "username": "#(credentials.siteAdmin.username)",
      "password": "#(credentials.siteAdmin.password)"
    }
    """
    When method post
    Then status 200
    And match response.role == "ROLE_SITE_ADMIN"
    * def siteAdminToken = response.token

    # Site Resident Token
    Given url baseUrl
    And path "gateway/gateway/resident/login"
    And header Content-Type = 'application/json'
    And request
    """
    {
      "username": "#(credentials.siteResident.username)",
      "password": "#(credentials.siteResident.password)"
    }
    """
    When method post
    Then status 200
    And match response.role == "ROLE_RESIDENT"
    * def siteResidentToken = response.token
