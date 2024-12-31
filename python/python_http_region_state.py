import requests


username = "username"
password = "password"
proxy_server = "t.pr.thordata.net:12233"
country = "us"
state = "alabama"

proxies = {
    "http": f"http://user-{username}-region-{country}-st-{state}:{password}@{proxy_server}"
}
response = requests.get("http://ipinfo.thordata.com", proxies=proxies)
print(response.text)