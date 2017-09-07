# .bashrc
#   / \
#  / | \  LOGIN
# /  o  \
################################################################################

########################################
# Default bash configuration
########################################
[ -f /etc/bashrc ] && source /etc/bashrc

########################################
# Custom bash configuration
########################################
[ -n ${HOME} ] || export HOME="~"

export BASH_DIR="${HOME}/.bash"
[ -d ${BASH_DIR} ] || exit

declare BASH_MANAGER="${BASH_DIR}/profile"
[ -f ${BASH_MANAGER} ] && source ${BASH_MANAGER}
