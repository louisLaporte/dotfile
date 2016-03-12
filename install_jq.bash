#!/usr/bin/env bash

BIN_PATH="/usr/local/bin"

rm ${BIN_PATH}/jq


if [ ! -e "$BIN_PATH/$JQ" ]
then
    case $(uname -o| tr '[:upper:]' '[:lower:]') in
        cygwin)
            _jqUrlCygwin="https://github.com/stedolan/jq/releases/download/jq-1.5/jq-win64.exe "
            _jqCygwin=$(basename ${_jqUrlCygwin} | cut -d "-" -f1)
            wget $_jqUrlCygwin -O ${BIN_PATH}/${_jqCygwin} &>/dev/null
            chmod +x ${BIN_PATH}/${_jqCygwin}
            ls -l ${BIN_PATH}
            which ${_jqCygwin}
            ;;
        *)
            echo "aa"
            ;;
    esac
fi
