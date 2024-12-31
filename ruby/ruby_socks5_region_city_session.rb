require 'socksify'
require 'net/http'

proxy_host = 't.pr.thordata.net' 
proxy_port = 12233 
proxy_username = 'username'
proxy_pass = 'password'
proxy_country = 'us'
proxy_city = 'houston'
proxy_sessid = 'a123123'
proxy_sesstime = 10
proxy_user = "user-#{proxy_username}-region-#{proxy_country}-city-#{proxy_city}-sessid=#{proxy_sessid}-sesstime=#{proxy_sesstime}"

TCPSocket::socks_server = proxy_host
TCPSocket::socks_port = proxy_port
TCPSocket::socks_username = proxy_user
TCPSocket::socks_password = proxy_pass

uri = URI('http://myip.thordata.net')
http = Net::HTTP.new(uri.host, uri.port)

request = Net::HTTP::Get.new(uri)

response = http.request(request)
puts response.body
