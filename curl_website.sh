#!/bin/bash

res=$?

if test "$res" != "0"; then
 printf  '%s\n' "the curl command failed with: $res"
fi

read -p "URL to check: " url
if curl --output /dev/null --silent --head --fail "$url"; then
  printf '%s\n' "$url exist"
else
  printf '%s\n' "$url does not exist"
fi
