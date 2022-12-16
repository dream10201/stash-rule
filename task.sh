#!/bin/bash
apt install whois -y

tmp=/tmp/.out
curl -sS https://core.telegram.org/resources/cidr.txt >> ipcidr-text.txt
curl -sS https://www.gstatic.com/ipranges/goog.json | perl -ne 'print "$1\n" if /Prefix\": \"(.+?)\"/' >> ipcidr-text.txt
whois -h whois.radb.net -- '-i origin AS32934' | grep ^route | perl -ne 'print "$1\n" if /route.+\s+(.+)/'>>ipcidr-text.txt
whois -h whois.radb.net -- '-i origin AS13414' | grep ^route | perl -ne 'print "$1\n" if /route.+\s+(.+)/'>>ipcidr-text.txt
whois -h whois.radb.net -- '-i origin AS4694' | grep ^route | perl -ne 'print "$1\n" if /route.+\s+(.+)/'>>ipcidr-text.txt

sort -u ipcidr-text.txt | uniq > $tmp
cat $tmp > ipcidr-text.txt

sort -u domain-text.txt | uniq > $tmp
cat $tmp > domain-text.txt

curl -sS https://purge.jsdelivr.net/gh/dream10201/stash-rule@master/ipcidr-text.txt
curl -sS https://purge.jsdelivr.net/gh/dream10201/stash-rule@master/domain-text.txt

