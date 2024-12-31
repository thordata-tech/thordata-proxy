import requests

username = "username"
password = "password"
proxy_server = "t.pr.thordata.net:12233"
country = "us"

proxies = {
    "http": f"socks5h://user-{username}-region-{country}:{password}@{proxy_server}",
    "https": f"socks5h://user-{username}-region-{country}:{password}@{proxy_server}",
}

response = requests.get("https://ipinfo.thordata.com", proxies=proxies)
print(response.text)
