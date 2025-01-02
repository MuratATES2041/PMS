function fn() {
    var env = karate.env || 'dev';
    karate.log('karate.env system property was:', env);

    var config = {
        baseUrl: 'http://51.44.133.5:81/swagger',
        credentials: {
            admin: {
                username: 'Admin',
                password: 'Ad12345678in.'
            },
            siteAdmin: {
                username: 'SiteAdmin',
                password: '12345678'
            },
            siteResident: {
                username: 'SiteResident',
                password: '12345678'
            }
        },
        headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json'
        }
    };

    return config;
}