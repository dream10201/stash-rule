#!/bin/bash
curl -sS https://core.telegram.org/resources/cidr.txt >> proxy-rule.txt
sort -u proxy-rule.txt | uniq > .out
cat .out > proxy-rule.txt
