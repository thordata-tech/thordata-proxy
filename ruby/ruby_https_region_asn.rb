require "uri"
require 'net/http'
require 'openssl'

proxy_host = 't.pr.thordata.net' 
proxy_port = 12233 
proxy_username = 'username'
proxy_pass = 'password'
proxy_country = 'us'
proxy_asn = 'AS10796'

proxy_user = "user-#{proxy_username}-region-#{proxy_country}-asn-#{proxy_asn}"

uri = URI.parse('https://ipinfo.thordata.com')

proxy = Net::HTTP::Proxy(proxy_host, proxy_port, proxy_user, proxy_pass)

req = Net::HTTP::Get.new(uri)

result = proxy.start(uri.host, uri.port, use_ssl: true, ssl_version: :TLSv1_2) do |http|
  http.request(req)
end

puts result.body
