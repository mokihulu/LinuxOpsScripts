#!/bin/bash

read -p "URL to check: " url

status_code=$(curl --write-out "%{http_code}" --output /dev/null "$url")

if [[ "$status_code" -ne 200 ]] ; then
  echo "Site status changed to $status_code"
else
  exit 0
fi
