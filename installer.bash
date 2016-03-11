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

#EDITOR_MANGER=$( $REPO_FILE | jq  ".editor.manager[].url ")
#EDITOR_COLORSCHEME=$( $REPO_FILE | jq ".editor.colorscheme[].url ")
EXTRA=$( $REPO_FILE | jq ".parser[].url" | tr -d '"')
#PARSER=$( $REPO_FILE | jq ".extra[].url")

# COLORS
RED="$(tput setaf 1)"
GREEN="$(tput setaf 2)"
RESET="$(tput sgr0)"

echo $EXTRA
#___________________________
# Array creation
uname | grep -i cygwin &>/dev/null

#___________________________
# change separator

printf "Git repo checking ...\n\n"

for list in "$(echo $EXTRA)"; do
   git ls-remote $list &>/dev/null 
    case $? in 
        0)
            printf "%-40s${GREEN}%s${RESET}\n" "$list" "[OK]"
            ;;
        128)    
            printf "%-40s${RED}%s${RESET}\n" "$list" "[FAIL]"
            ;;
        *)
            printf "%-40s\n" "Unknown status"
            ;;
    esac
done
