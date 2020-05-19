#!/bin/bash
 
errors=$(grep -A1 "Exception description" filename.txt | grep -v '^\-\-' | sed '$!N;s/\n/ : /')
 
while IFS= read -r line
do 
  vs=$(awk -F" " '{print $11}' <<< $line)
  exception=$(awk -F ' : ' '{print $2}' <<< $line)
 
  echo "{\"vs\": \"${vs}\", \"exception\": \"${exception}\"}\n"
done <<< "$errors"
