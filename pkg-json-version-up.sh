#!/bin/bash

# Usage: ~/update-pkg-json.sh <path to package.json>
# e. g. ~/update-pkg-json.sh ./package.json

path=$1;

version=`grep -Po '(?<=version":\s")\d+.\d+.\d+' $path`

echo $version

version_upgraded=`echo $version | awk -F. -v OFS=. 'NF==1{print ++$NF}; NF>1{if(length($NF+1)>length($NF))$(NF-1)++; $NF=sprintf("%0*d", length($NF), ($NF+1)%(10^length($NF))); print}'`;

echo $version_upgraded;

to_be_replaced="\"version\": \"$version";
replace_by="\"version\": \"$version_upgraded";

sed -i "s/$to_be_replaced/$replace_by/" $path

cat $path | grep "\"version\":"; 
