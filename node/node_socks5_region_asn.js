const rp = require('request-promise');
const { SocksProxyAgent } = require('socks-proxy-agent');  

const username = "username";
const password = "password";
const proxyServer = "t.pr.thordata.net:12233";
const country = "us";
const asn = "AS10796";

const proxyUrl = `socks5h://user-${username}-region-${country}-asn-${asn}:${password}@${proxyServer}`;
const agent = new SocksProxyAgent(proxyUrl);  

rp({
    url: 'https://ipinfo.thordata.com',  
    agent: agent,  
})
.then(function(data) {
    console.log(data);  
})
.catch(function(err) {
    console.error(err);  
});