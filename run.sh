#!/bin/bash 

mkdir -p nvd_pages

while read cve
do
#1. download page
  if [ ! -f nvd_pages/"$cve" ]; then
     wget https://nvd.nist.gov/vuln/detail/"$cve" -P nvd_pages/ >> wget_log 2>> wget_log
  fi
#2. extract commit id
cid=`cat nvd_pages/"$cve" | grep -e"http://git" -e "https://git" -e "https://sourceware" |egrep -o "[0-9a-z]{40}"|sort|uniq`
echo $cve, $cid


done < cves.source
