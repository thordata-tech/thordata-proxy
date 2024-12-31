import requests

username = "username"
password = "password"
proxy_server = "t.pr.thordata.net:12233"
country = "us"

proxies = {"https": f"http://user-{username}-region-{country}:{password}@{proxy_server}"}
response = requests.get("https://ipinfo.thordata.com", proxies=proxies)
print(response.text)