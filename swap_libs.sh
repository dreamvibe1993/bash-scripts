#!/bin/sh

from=$1;
to=$2;

echo "Swapping files \nfrom: $from \nto: $to";

sudo rm -rf $to;

cp $from $to -r;