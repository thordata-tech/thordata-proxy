require 'socksify'
require 'net/http'

proxy_host = 't.pr.thordata.net' 
proxy_port = 12233 
proxy_username = 'username'
proxy_pass = 'password'
proxy_country = 'us'
proxy_state = 'alabama'

proxy_user = "user-#{proxy_username}-region-#{proxy_country}-st-#{proxy_state}"

TCPSocket::socks_server = proxy_host
TCPSocket::socks_port = proxy_port
TCPSocket::socks_username = proxy_user
TCPSocket::socks_password = proxy_pass

uri = URI('http://ipinfo.thordata.com')
http = Net::HTTP.new(uri.host, uri.port)

request = Net::HTTP::Get.new(uri)

response = http.request(request)
puts response.body
