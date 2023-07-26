#
# ~/.bashrc
#

# If not running interactively, don't do anything
#[[ $- != *i* ]] && return


[ -f $HOME/.config/shell_related/aliases ] && source $HOME/.config/shell_related/aliases
[ -f $HOME/.config/shell_related/functions ] && source $HOME/.config/shell_related/functions

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
	echo '(╯°□ °)╯︵ X∩NI˥'
    fi
}

PS1='\[$BOLD\]\[$RED\]\u\[$RESET\]@\[$BOLD\]\[$RED\]\h\[$RESET\] \[$GREEN\]\w\[$RESET\]\n\[$BOLD\]\[$BLUE\]$(exitstatus)\[$RESET\]\[$BOLD\] -->\[$RESET\] '
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

# FZF
source /usr/share/fzf/key-bindings.bash
source /usr/share/fzf/completion.bash
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
# When selecting files with fzf, we show file content with syntax highlighting,
# or without highlighting if it's not a source file. If the file is a directory,
# we use tree to show the directory's contents.
# We only load the first 200 lines of the file which enables fast previews
# of large text files.
# Requires highlight and tree: pacman -S highlight tree
export FZF_DEFAULT_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null ||
cat {} || tree -C {}) 2> /dev/null | head -200' --preview-window=up:50%"

# Change directory without cd command
shopt -s autocd

# Append to history
shopt -s histappend

# Para que al expandir no ponga "\" en los caractéres especiales
shopt -s direxpand

# Para poder browsear por la history con las flechas
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
bind '"\e[D": backward-char'
bind '"\e[C": forward-char'

#Para que arranque el ibus
export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus


# Para autocompletar en pmbootstrap
eval "$(register-python-argcomplete pmbootstrap)"

complete -cf sudo


