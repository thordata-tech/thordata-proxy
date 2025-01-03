const rp = require('request-promise');

const proxyServer = "t.pr.thordata.net:12233";

rp({
    url: 'https://ipinfo.thordata.com',  
    proxy: `http://${proxyServer}`,  
})
.then(function(data) {
    console.log(data);  
})
.catch(function(err) {
    console.error(err); 
});
