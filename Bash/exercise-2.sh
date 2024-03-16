#!/bin/bash

file=$1

for line in `cat "$file"`
do
  if echo "$line" | grep -q '#'
  then
    echo "$line" | sed 's/#.*//'
  else
    echo "$line"
  fi
done
