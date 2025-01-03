require "uri"
require 'net/http'

proxy_host = 't.pr.thordata.net'
proxy_port = 12233

uri = URI.parse('https://ipinfo.thordata.com')
proxy = Net::HTTP::Proxy(proxy_host, proxy_port)  # 不再使用用户名和密码

req = Net::HTTP::Get.new(uri)

result = proxy.start(uri.host, uri.port, use_ssl: true) do |http|
  http.request(req)
end

puts result.body
