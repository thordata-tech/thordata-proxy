require "uri" 
require 'net/http' 

proxy_host = 't.pr.thordata.net' 
proxy_port = 12233 
proxy_user = 'username' 
proxy_pass = 'password' 

uri = URI.parse('https://ipinfo.thordata.com') 
proxy = Net::HTTP::Proxy(proxy_host, proxy_port, proxy_user, proxy_pass) 

req = Net::HTTP::Get.new(uri)

result = proxy.start(uri.host, uri.port, use_ssl: true) do |http| 
  http.request(req) 
end 

puts result.body
