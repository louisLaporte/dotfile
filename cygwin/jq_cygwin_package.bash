#!/usr/bin/env bash
for i in $(cat ./cygwin_packages.json | jq '.[] | .basic | .[]' | tr -d '"')
do
    apt-cyg install $i 
done
