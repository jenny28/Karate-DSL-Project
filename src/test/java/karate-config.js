function fn() {
    var env = karate.env; // get system property 'karate.env'
    karate.log('karate.env system property was:', env);
    if (!env) {
        env = 'dev';
    }
    var config = {
        env: env,
        myVarName: 'someValue',
        mainURL:"https://dummyjson.com/auth"
    }
    if (env == 'dev') {
        // customize
        // e.g. config.foo = 'bar';
    } else if (env == 'e2e') {
        // customize
    }
    const result = karate.callSingle('classpath:examples/dummyjson/login.feature')
    config.auth = {"Authorization": `Bearer ${result.token}`}
    return config;
}