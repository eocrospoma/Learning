#!/bin/bash
# 
# run like this:
# ./exercise-1.sh sample-ex1.txt

file=$1
cleanList=()

for line in `cat $file`
do
  noRepeatedFiles=`echo $line | sed 's/|/\n/g' | sort -t '.' -k1 | cut -d. -f1 | sort | uniq -c | awk '{ if ($1 == 1 ) { print $2} else { next} }'`
  clearLine=`echo $line | sed 's/|/\n/g'`
  
  for originalFile in `echo $clearLine`
  do
    for matchFile in `echo $noRepeatedFiles`
    do
      if echo "$originalFile" | grep -q "$matchFile"
      then
        cleanList+=(`echo "$originalFile"`)
      fi
    done
  done
    if [ ${#cleanList[@]} -eq 0 ]
    then
       continue
    else
      echo "${cleanList[@]}" | tr ' ' '|' | sed 's/|$//g'
      cleanList=()
    fi
done
