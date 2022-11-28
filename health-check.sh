#!/bin/sh

green='\033[0;32m'
red='\e[31m%s\e[0m'
default='\e[0m'

while true; do
    resp=$(curl -s -I https://hello-world-displayr-dummy-server.s3.ap-southeast-2.amazonaws.com/index.html)

    status=$(echo "$resp" | awk "/HTTP\/1.1 /{print}" | cut -d' ' -f2-)
    code=$(echo "$status" | cut -d ' ' -f1)
    date=$(echo "$resp" | awk "/Date: /{print}" | cut -d' ' -f2-)

    if [ "${code}" -eq "200" ]; then
        printf "${green}%s " "${status}"
    else
        printf "${red}%s " "${status}"
    fi

    printf "${default}| %s\n" "${date}"
    sleep 10
done
