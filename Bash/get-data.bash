#!/bin/bash

url=https://storage.googleapis.com/storage/v1/b/p-2-cen1/o/October%2F1%2FOctober_105_1.txt

json=`mktemp`

generation=`curl --silent ${url} | jq .generation | cut --delimiter=\" --fields=2`
curl --silent --output ${json} "${url}?alt=media&generation=${generation}"
wc --lines ${json}
declare -a values

for index in 2003 2004 2005 2009 2010 2011 2012 2013 2014 2015 ; do
  value=`jq .Parameter_${index}.Value ${json}`
  echo index \[${index}\], value \[${value}\]
  values[${index}]=${value}
done

// TODO Replace;
echo ${values[*]}
// ... which code which squirts it into a file to become a serial connection into Fuse

rm --force ${json}

exit 0
