#!/bin/bash

weather_m=$(curl -s "wttr.in/?format=1")

weather_t=$(curl -s "wttr.in/?format=4")

echo "{\"text\": \"$weather_m\", \"tooltip\": \"$weather_t\"}"