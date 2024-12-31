package main

import (
	"fmt"
	"io/ioutil"
	"log"
	"net/http"

	"golang.org/x/net/proxy"
)

const (
	resourceUrl = "https://ipinfo.thordata.com"
	socks5Proxy = "t.pr.thordata.net:12233"
	username    = "username"
	password    = "password"
	country     = "us"
)

func main() {
	proxyUserName := fmt.Sprintf("user-%s-region-%s", username, country)
	proxyUrl := socks5Proxy

	auth := proxy.Auth{
		User:     proxyUserName,
		Password: password,
	}

	dialer, err := proxy.SOCKS5("tcp", proxyUrl, &auth, proxy.Direct)
	if err != nil {
		log.Fatal(err)
	}

	client := http.Client{
		Transport: &http.Transport{
			Dial: dialer.Dial,
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
