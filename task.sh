#!/bin/bash

curl -sS https://core.telegram.org/resources/cidr.txt >> ipcidr-text.txt
curl -sS https://www.gstatic.com/ipranges/goog.json | perl -ne 'print "$1\n" if /Prefix\": \"(.+?)\"/' >> ipcidr-text.txt


sort -u ipcidr-text.txt | uniq > .out
cat .out > ipcidr-text.txt

sort -u domain-text.txt | uniq > .out
cat .out > domain-text.txt

curl -sS https://purge.jsdelivr.net/gh/dream10201/stash-rule@master/ipcidr-text.txt
curl -sS https://purge.jsdelivr.net/gh/dream10201/stash-rule@master/domain-text.txt


rm .out
