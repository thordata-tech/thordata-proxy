import requests

username = "username"
password = "password"
proxy_server = "t.pr.thordata.net"

proxies = {"http": f"http://{username}:{password}@{proxy_server}"}
response = requests.get("https://ipinfo.thordata.com", proxies=proxies)
print(response.text)
