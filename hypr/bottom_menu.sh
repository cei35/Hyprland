#!/bin/bash

taskbar="$@"

pid=$(pgrep -f "$taskbar")

mapfile -t process <<< "$pid"
nb=${#process[@]}

if [[ $nb -lt 2 ]]; then
    $taskbar
    exit 1
fi

for ((i=0; i<$nb; i++)); do
    if (( i % 2 != 0 )); then
        p="${process[$i]}"
        kill "$p"
    fi
done

