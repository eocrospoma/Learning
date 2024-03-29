#!/bin/bash
#
# Usage:
#
# ./exercise-3.sh sample-ex3-books.txt sample-ex3-categories.txt

books=$1
categories=$2

stock_list() {
  
  listOfCategories=()
  for category in `cat $categories | tr ',' ' '`
  do
    listOfCategories+=("$category")
  done

  first="${listOfCategories[0]}"
  second="${listOfCategories[1]}"
  third="${listOfCategories[2]}"
  fourth="${listOfCategories[3]}"

  cat "$books" | tr ',' '\n' | sort -k1 | awk -F ' ' \
    -vfirst="^${first}" \
    -vsecond="^${second}" \
    -vthird="^${third}" \
    -vfourth="^${fourth}" \
    '$1 ~ first {sumFirst+=$2} \
     $1 ~ second {sumSecond+=$2} \
     $1 ~ third {sumThird+=$2} \
     $1 ~ fourth {sumFourth+=$2} \
     END { sub(/\^/,"",first) sub(/\^/,"",second) sub(/\^/,"",third) sub(/\^/,"",fourth) ; print "(" first " : " (sumFirst=="" ? "0" : sumFirst)") - (" second " : " (sumSecond=="" ? "0" : sumSecond)") - (" third " : " (sumThird=="" ? "0" : sumThird) ") - (" fourth " : " (sumFourth=="" ? "0" : sumFourth) ")"  }'
}

stock_list "$books" "$categories"
