package main

import (
	"fmt"
	"io/ioutil"
	"log"
	"net/http"
	"net/url"
)

const (
	resourceUrl = "https://ipinfo.thordata.com"
	proxyHost   = "hiesllxm.pr.thordata.net:12233"
	username    = "username"
	password    = "password"
	country     = "us"
	asn        = "AS10796"
)

func main() {
	proxyUserName := fmt.Sprintf("user-%s-region-%s-asn-%s", username, country, asn)
	proxyUrl := &url.URL{
		Scheme: "http",
		User:   url.UserPassword(proxyUserName, password),
		Host:   proxyHost,
	}

	client := http.Client{
		Transport: &http.Transport{
			Proxy: http.ProxyURL(proxyUrl),
		},
	}

	resp, err := client.Get(resourceUrl)
	if err != nil {
		log.Fatal(err)
	}
	defer resp.Body.Close()

	body, err := ioutil.ReadAll(resp.Body)
	if err != nil {
		log.Fatal(err)
	}

	bodyString := string(body)
	fmt.Println(bodyString)
}
