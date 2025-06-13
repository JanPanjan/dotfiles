#!/bin/bash

while true; do
    DATE_TIME=$(date +'%A, %b %d. %H:%M:%S')

    BATTERY_INFO=""

    if command -v acpi &> /dev/null; then
        # Example output: Battery 0: Discharging, 85%, 00:45:00 remaining
        BATTERY_PERCENTAGE=$(acpi -b | grep -P -o '[0-9]+(?=%)')
        BATTERY_STATUS=$(acpi -b | grep -P -o '(?<=: ).*(?=, [0-9]+%)' | awk '{print $1}')

        if [ -n "$BATTERY_PERCENTAGE" ]; then
            if [ "$BATTERY_STATUS" = "Charging" ]; then
                BATTERY_INFO="BAT: ${BATTERY_PERCENTAGE}%+" # Charging icon
            elif [ "$BATTERY_STATUS" = "Full" ]; then
                BATTERY_INFO="BAT: ${BATTERY_PERCENTAGE}%!" # Full icon
            else
                BATTERY_INFO="BAT: ${BATTERY_PERCENTAGE}%-"
            fi
        fi
    fi

    VOLUME_INFO=""

    if command -v pactl &> /dev/null; then
        VOLUME_PERCENTAGE=$(pactl get-sink-volume @DEFAULT_SINK@ | grep -Po '[0-9]+(?=%)' | head -n 1)
        MUTE_STATUS=$(pactl get-sink-mute @DEFAULT_SINK@ | awk '{print $2}')

        if [ -n "$VOLUME_PERCENTAGE" ]; then
            if [ "$MUTE_STATUS" = "yes" ]; then
                VOLUME_INFO="VOL: Mute"
            else
                VOLUME_INFO="VOL: ${VOLUME_PERCENTAGE}%"
            fi
        fi
    fi

    BRIGHTNESS_INFO=""

    if command -v brightnessctl &> /dev/null; then
        CURRENT_BRIGHTNESS=$(brightnessctl g)
        MAX_BRIGHTNESS=$(brightnessctl m)

        if [ "$MAX_BRIGHTNESS" -gt 0 ]; then # Avoid division by zero
            BRIGHTNESS_PERCENTAGE=$(( (CURRENT_BRIGHTNESS * 100) / MAX_BRIGHTNESS ))
            BRIGHTNESS_INFO="BRH: ${BRIGHTNESS_PERCENTAGE}%"
        fi
    fi

    if [ -n "$BATTERY_INFO" ]; then
        OUTPUT_LINE="$BATTERY_INFO"
    fi
    if [ -n "$VOLUME_INFO" ]; then
        OUTPUT_LINE="$OUTPUT_LINE | $VOLUME_INFO"
    fi
    if [ -n "$BRIGHTNESS_INFO" ]; then
        OUTPUT_LINE="$OUTPUT_LINE | $BRIGHTNESS_INFO"
    fi

    OUTPUT_LINE="$OUTPUT_LINE | $DATE_TIME"

    echo "$OUTPUT_LINE"

    sleep 1
done
