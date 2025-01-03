Feature: SiteAdminToken Create

  Scenario: SiteAdminToken
    Given url "http://51.44.133.5:81/swagger"
    And path "/gateway/gateway/site-admin/login"
    And request {"username": "**********", "password": "*********"}
    And header Content-Type = "application/json"
    When method post
    Then status 200
    And assert response.role == "ROLE_SITE_ADMIN"

    # Token'ı dosyaya yaz
    And def siteAdminTokenFilePath = 'src/test/java/utils/siteAdminToken.txt'

    * eval
      """
      var FileWriter = Java.type('java.io.FileWriter');

      var writer = new FileWriter(siteAdminTokenFilePath);
      writer.write(response.token);
      writer.close();
      """

