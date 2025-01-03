import requests

proxy_server = "t.pr.thordata.net:12233"

proxies = {"http": f"http://{proxy_server}"}
response = requests.get("https://ipinfo.thordata.com", proxies=proxies)
print(response.text)
