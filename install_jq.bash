#!/usr/bin/env bash

URL="https://github.com/stedolan/jq.git"
JQ=$(basename $URL)
BIN_PATH="/usr/local/bin"



echo $JQ | cut -d . -f1
git clone $URL

if [ ! -e "$BIN_PATH/$JQ" ]
then
    cd $(echo $JQ | cut -d . -f1)
    autoreconf -i
    ./configure 
    make && sudo make install
    cp $JQ $BIN_PATH
    cd ..
    rm -rf ./$JQ
fi
