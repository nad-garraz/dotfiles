#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

[[ -f $HOME_CONFIG/shell_related/aliases ]] && source $HOME_CONFIG/shell_related/aliases
[[ -f $HOME_CONFIG/shell_related/functions ]] && source $HOME_CONFIG/shell_related/functions


#BASH PROMPT TUNEADA
START_COLOR="\[\e[31;44;1m\]"
END_COLOR="\[\e[0m\]"
BOLD="$(tput bold)"
RED="$(tput setaf 1)"
GREEN="$(tput setaf 2)"
BLUE="$(tput setaf 4)"
CYAN="$(tput setaf 6)"
RESET="$(tput sgr0)"

exitstatus()
{
    if [[ $? == 0 ]]
    then
	echo '(◠_◠)'
    else
	echo "(╯°□ °)╯︵ X∩NI˥"
    fi
}

PS1='\[$BOLD\]\[$RED\]\u\[$RESET\] at \[$GREEN\]\w\[$RESET\]\n\[$BOLD\]\[$BLUE\]$(exitstatus)\[$RESET\]\[$BOLD\] -->\[$RESET\] '
#PS1='[\u@\h \W]\$ '


# PARA TENER COLORES EN LAS MAN PAGES
man() {
    LESS_TERMCAP_md=$'\e[01;31m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[01;44;33m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[01;32m' \
    command man "$@"
}

# Command not found helper
source /usr/share/doc/pkgfile/command-not-found.bash

# Change directory without cd command
shopt -s autocd
# Append to history
shopt -s histappend

# Para poder browsear por la history con las flechas
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

#Para que arranque el ibus
export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus
