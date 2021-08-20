package main

import (
	"bytes"
	"encoding/json"
	"flag"
	"fmt"
	"io/ioutil"
	"log"
	"net/http"
)

type WeatherData struct {
	TempC   float32 `json:"temp"`
	Weather string  `json:"wx_phrase"`
}

type Weather struct {
	CurrentObservation WeatherData `json:"observation"`
}

func getWeather() WeatherData {
	// ibm cloud service credentials
	// {
	// "username": "41c8b318-9d34-4722-80e5-cf4bd5f73058",
	// "password": "3ATwZ36EZD",
	// "host": "twcservice.mybluemix.net",
	// "port": 443,
	// "url": "https://41c8b318-9d34-4722-80e5-cf4bd5f73058:3ATwZ36EZD@twcservice.mybluemix.net"
	// }

	// (43.856098, -79.337021) is Markham
	var auth = "41c8b318-9d34-4722-80e5-cf4bd5f73058:3ATwZ36EZD"
	var lat = "43.85"
	var lon = "-79.33"
	var url = fmt.Sprintf("https://%s@twcservice.mybluemix.net/api/weather/v1/geocode/%s/%s/observations.json?language=en-US&units=m", auth, lat, lon)

	res, err := http.Get(url)
	if err != nil {
		log.Fatal(err)
	}
	defer res.Body.Close()
	body, _ := ioutil.ReadAll(res.Body)
	var weather Weather
	json.Unmarshal(body, &weather)
	return weather.CurrentObservation
}

func fmtWeather(weather WeatherData) string {
	return fmt.Sprintf("%s %v°C\n", weather.Weather, weather.TempC)
}

func (weather WeatherData) fmtWeather() string {
	return fmt.Sprintf("%s %v°C\n", weather.Weather, weather.TempC)
}

func main() {
	var update = flag.Bool("update", false, "fetches the latest weather, updates the cached file, and prints the weather")
	var get = flag.Bool("get", false, "fetches and prints the weather without saving")
	flag.Parse()
	if *get {
		fmt.Printf("%s", fmtWeather(getWeather()))
		return
	}
	// TODO: not hardcode this
	var path = "/Users/cal/bin/weather.current"
	// try to read weather.current
	currentWeather, err := ioutil.ReadFile(path)
	// write weather.current either because it's update time, or because it doesn't exist
	if err != nil || *update {
		current := getWeather().fmtWeather()
		ioutil.WriteFile(path, bytes.NewBufferString(current).Bytes(), 0644)
		fmt.Printf("%s", current)
	} else {
		fmt.Printf("%s", bytes.NewBuffer(currentWeather).String())
	}
}
