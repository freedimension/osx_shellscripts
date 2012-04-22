#!/bin/bash
#loading weather information to weather.dat / I set geektool to do this every 1 minute
#replace "000000" with your city code (you can find it if you go to the site) and "u=c" with "u=f" if you wish to have Fahrenheit data

PT_PATH=/Users/mirko/Scripts/weather
#curl --silent "http://xml.weather.yahoo.com/forecastrss?w=650434&u=c" > "${PT_PATH}_yahoo.tmp"
curl --silent "http://www.google.com/ig/api?weather=71691-Germany&hl=de" > "${PT_PATH}_google.tmp"

#if no data available (e.g. net is down), use the previously dowloaded data instead of creating a file with 0 bytes
#if [ "`ls -l "${PT_PATH}_yahoo.tmp" | awk '{print $5}'`" != "0" ]
#then
#	mv "${PT_PATH}_yahoo.tmp" "${PT_PATH}_yahoo.xml"
#fi

if [ "`ls -l "${PT_PATH}_google.tmp" | awk '{print $5}'`" != "0" ]
then
	mv "${PT_PATH}_google.tmp" "${PT_PATH}_google.xml"
	php -f /Users/mirko/Scripts/parse_google_weather.php > /Users/mirko/Scripts/weather.dat
fi
