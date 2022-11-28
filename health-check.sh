#!/bin/sh

while true; do
    resp=$(curl -s -I https://hello-world-displayr-dummy-server.s3.ap-southeast-2.amazonaws.com/index.html)

    status=$(echo "$resp" | awk "/HTTP\/1.1 /{print}" | cut -d' ' -f2-)
    date=$(echo "$resp" | awk "/Date: /{print}" | cut -d' ' -f2-)
    printf "%s | %s\n" "${status}" "${date}"
    sleep 10
done
