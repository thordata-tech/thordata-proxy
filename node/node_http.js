const rp = require('request-promise');

const username = "username";
const password = "password";
const proxyServer = "t.pr.thordata.net";

rp({
    url: 'https://ipinfo.thordata.com',  
    proxy: `http://${username}:${password}@${proxyServer}`,  
})
.then(function(data) {
    console.log(data);  
})
.catch(function(err) {
    console.error(err); 
});
