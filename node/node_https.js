const rp = require('request-promise');

const username = "username";
const password = "password";
const proxyServer = "t.pr.thordata.net:12233";

rp({
    url: 'https://ipinfo.thordata.com',
    proxy: `https://${username}:${password}@${proxyServer}`,
})
.then(function(data) {
    console.log(data);
})
.catch(function(err) {
    console.error(err);
});
