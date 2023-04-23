#!/bin/bash

# Fetch weather information
weather=$(curl -s "https://wttr.in/?format=1")

# Extract the temperature value using regex
if [[ $weather =~ \+([0-9]+) ]]; then
    temperature="${BASH_REMATCH[1]}"
else
    echo "#[fg=#a6e3a1]${weather}" # Default color
    exit 0
fi

# Set color based on temperature range and display the weather string
if (( temperature >= 38 )); then
    echo "#[fg=#FF4500]${weather}" # Orange-red
elif (( temperature >= 28 )); then
    echo "#[fg=#FFA500]${weather}" # Orange
elif (( temperature >= 18 )); then
    echo "#[fg=#32CD32]${weather}" # Lime green
elif (( temperature >= 8 )); then
    echo "#[fg=#1E90FF]${weather}" # Dodger blue
else
    echo "#[fg=#00BFFF]${weather}" # Deep sky blue
fi
