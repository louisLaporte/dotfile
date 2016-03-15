#!/usr/bin/env bash
#???????????????????
#
#TODO: change FILE_PATH this is very ugly way to do that
#
#??????????????????

##install apt-cyg
MANAGER="raw.github.com/transcode-open/apt-cyg/master/apt-cyg"
BIN_PATH="/usr/local/bin"


# this is done like that because the script is sourcing in a parent folder (..)
FILE_PATH="$(dirname ${BASH_SOURCE[0]})/cygwin_packages.json" 


echo $(readlink -f $0)


install_manager() {
    if [ ! -e "$BIN_PATH/$MANAGER" ]
    then
        wget $MANAGER -O ${BIN_PATH}/$(basename $MANAGER) &>/dev/null
        chmod +x ${BIN_PATH}/$(basename $MANAGER) 
    fi

}

install_packages() {
    printf "+- install basic packages\n"
    for i in $(cat $FILE_PATH | jq '.[] | .basic | .[]'   | tr -d '"' | tr -d "\r")
    do
        # or setup-x86.exe -q -P [package name]
        apt-cyg install $i 
    done
    printf "+- install extra packages\n"
    for i in $(cat $FILE_PATH | jq '.[] | .extra | .[]'   | tr -d '"' | tr -d "\r")
    do
        # or setup-x86.exe -q -P [package name]
        apt-cyg install $i 
    done
}



