#!/usr/bin/env bash



##install apt-cyg
MANAGER="apt-cyg"
BIN_PATH="/usr/local/bin"


install_manager() {
if [ ! -e "$BIN_PATH/$MANAGER" ]
then
    wget raw.github.com/transcode-open/apt-cyg/master/apt-cyg
    chmod +x $MANAGER
    mv $MANAGER $BIN_PATH
fi
}

install_packages() {
    ./jq_cygwin_package.bash
}
set -x
install_packages
##or from setup
#setup-x86.exe -q -P [package name]
