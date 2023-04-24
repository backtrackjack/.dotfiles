#!/bin/bash

# Set the minimum and maximum temperature range
min_temp=10
max_temp=40

# Fetch weather information
weather=$(curl -s "https://wttr.in/?format=1")

# Extract the temperature value using regex
if [[ $weather =~ \+([0-9]+) ]]; then
    temperature="${BASH_REMATCH[1]}"
else
    echo "#[fg=#00BFFF]${weather}" # Must be cold
    exit 0
fi

# Calculate color based on temperature
get_color() {
    local temp=$1
    local r g b

    if (( temp < (min_temp + max_temp) / 2 )); then
        # Gradient from blue (min_temp) to green (midpoint)
        r=0
        g=$(( 255 * (temp - min_temp) / ((min_temp + max_temp) / 2 - min_temp) ))
        b=$(( 255 - g ))
    else
        # Gradient from green (midpoint) to red (max_temp)
        r=$(( 255 * (temp - (min_temp + max_temp) / 2) / (max_temp - (min_temp + max_temp) / 2) ))
        g=$(( 255 - r ))
        b=0
    fi

    printf "#[fg=#%02x%02x%02x]%s" $r $g $b "${weather}"
}

# Set color based on temperature range and display the weather string
if (( temperature > max_temp )); then
    temperature=max_temp
elif (( temperature < min_temp )); then
    temperature=min_temp
fi
get_color $temperature
