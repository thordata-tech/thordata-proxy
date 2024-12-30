import requests


username = "username"
password = "password"
proxy_server = "t.pr.thordata.net:12233"
country = "us"
city = "houston"
sessid = "a123123"
sesstime = 10

proxies = {
    "http": f"http://user-{username}-region-{country}-city-{city}-sessid-{sessid}-sesstime-{sesstime}:{password}@{proxy_server}"
}
response = requests.get("http://ipinfo.thordata.com", proxies=proxies)
print(response.text)
