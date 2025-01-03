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
	proxyHost   = "t.pr.thordata.net:12233"
)

func main() {
	proxyUrl := &url.URL{
		Scheme: "http",
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
