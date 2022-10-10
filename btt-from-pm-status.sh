#!/usr/bin/env bash

set -eo pipefail

print_res() {
    color=$1
    # \"font_color\": \"100,200,100,255\", \
    # \"font_size\": 10
    # \"icon_path\":\"path_to_new_icon\", \
    # \"icon_data\": \"base64_icon_data\", \
    echo "{ \
        \"background_color\": \"$color\" \
    }"
    exit 0
}

status="$1"

red="191,97,106,255"
blackest="46,52,64,255"
black="67,76,94,255"
green="163,190,140,255"
yellow="235,203,139,255"

if [ "$status" == "not_running" ]; then
    print_res "$blackest"
elif [ "$status" == "stopped" ]; then
    print_res "$black"
elif [ "$status" == "stopping" ]; then
    print_res "$yellow"
elif [ "$status" == "online" ]; then
    print_res "$green"
elif [ "$status" == "errored" ]; then
    print_res "$red"
else
    print_res "$red"
fi
