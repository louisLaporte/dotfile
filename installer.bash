#!/usr/bin/env bash
#-------------------------
## @author louis laporte   
## @file installer.bash
#
#-------------------------
#?????????????????????????
#
#TODO:  - run json command 
#       - check priority before 0, is the highest
#       - add global variable in json
#       - add path where to install
#       - check if json if valid
#       - find in dotfile/ repo.json
#       - add json path 
#?????????????????????????


REPO_FILE="cat repo.json"


# COLORS
RED="$(tput setaf 1)"
GREEN="$(tput setaf 2)"
RESET="$(tput sgr0)"


:
#___________________________
# Array creation
if [ -e "/usr/local/bin/jq" ]
then
    rm /usr/local/bin/jq 
fi
if [ -e "/usr/local/bin/apt-cyg" ]
then
    rm /usr/local/bin/apt-cyg 
fi

#___________________________
# change separator
JQ="install_jq.bash"
printf "+ Downloading jq (json parser) binary ...\n"
if [ ! -e "$JQ" ]
then
    printf "$JQ not found in current directory"
else
    ./$JQ
    case $(uname -o| tr '[:upper:]' '[:lower:]') in
        cygwin)
            printf "+ installing packages for cygwin ...\n"
            . ./cygwin/cygwin_manager.bash
            install_manager
            install_packages
            ;;
        *)
            echo "aa"
            ;;
    esac
fi
#: '
#PARSER=$( $REPO_FILE | jq ".parser[].url" | tr -d '"' | tr -d "\r")
#EXTRA=$( $REPO_FILE | jq ".extra[].url" | tr -d '"' | tr -d "\r")
#EDITOR_MANGER=$( $REPO_FILE | jq  ".editor.manager[].url ")
#EDITOR_COLORSCHEME=$( $REPO_FILE | jq ".editor.colorscheme[].url ")
#
#printf "Git repo checking ...\n\n"
#
#for list in "$(echo $PARSER)" "$(echo $EXTRA)"; do
#    git ls-remote $list &>/dev/null 
#    case $? in 
#        0)
#            printf "%-40s${GREEN}%s${RESET}\n" "$list" "[OK]"
#            ;;
#        128)    
#            printf "%-40s${RED}%s${RESET}\n" "$list" "[FAIL]"
#            ;;
#        *)
#            printf "%-40s\n" "Unknown status"
#            ;;
#    esac
#done
#'
