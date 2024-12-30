const rp = require('request-promise');

const username = "username";
const password = "password";
const proxyServer = "t.pr.thordata.net:12233";
const country = "us";
const city = "houston";
const sessid = "a123123"
const sesstime = "10"

rp({
    url: 'http://ipinfo.thordata.com',  
    proxy: `http://user-${username}-region-${country}-city-${city}-sessid-${sessid}-sesstime-${sesstime}:${password}@${proxyServer}`,  
})
.then(function(data) {
    console.log(data);  
})
.catch(function(err) {
    console.error(err); 
});
