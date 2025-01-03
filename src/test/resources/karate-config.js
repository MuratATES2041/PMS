function fn() {
    var env = karate.env || 'dev';
    karate.log('karate.env system property was:', env);

    var config = {
        baseUrl: 'http://51.44.133.5:81/swagger',
        credentials: {
            admin: {
                username: '********',
                password: '*********'
            },
            siteAdmin: {
                username: '****',
                password: '******'
            },
            siteResident: {
                username: '******',
                password: '***********'
            }
        },
        headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json'
        }
    };

    return config;
}
