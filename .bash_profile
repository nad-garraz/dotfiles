# ~/.bash_profile

[[ -f "$HOME/.bashrc" ]] && . "$HOME/.bashrc"
[[ -d $HOME/.local/bin ]] && PATH="$HOME/.local/bin:$PATH"
[[ -d $HOME/.local/scripts ]] && PATH="$(du "$HOME/.local/scripts" | cut -f2 | tr '\n' ':' | sed 's/:*$//'):$PATH"



## PARA QUE EL FAF LEVANTE LA VERSION CORRECTA DE JAVA
# ver la variable en /usr/bin/downlords-faf-client
# export INSTALL4J_JAVA_HOME="/usr/lib/jvm/java-15-adoptopenjdk"


# Terminal
export TERMINAL="alacritty"
export TERM="xterm"
export BROWSER="brave"

# Colores
BOLD="$(tput bold)"
export BOLD 
BLACK="$(tput setaf 0)"
export BLACK
RED="$(tput setaf 1)"
export RED
GREEN="$(tput setaf 2)"
export GREEN
YELLOW="$(tput setaf 3)"
export YELLOW
BLUE="$(tput setaf 4)"
export BLUE
MAGENTA="$(tput setaf 5)"
export MAGENTA
CYAN="$(tput setaf 6)"
export CYAN
WHITE="$(tput setaf 7)"
export WHITE
DIM="$(tput dim)"
export DIM
NORMAL="$(tput sgr0)"
export NORMAL


# Most commonly used paths
export HOME="/home/nad"
export HOME_CONFIG="$HOME/.config"
export HOME_LOCAL="$HOME/.local"
export HOME_SCRIPTS="$HOME_LOCAL/scripts"
export HOME_ICONS="$HOME_LOCAL/icons"
export DWMBAR="$HOME_CONFIG/dwmbar"
export LOGS="$HOME_LOCAL/my_logs"

# Wise
source $HOME/documents/tokens

# locations
source $HOME/documents/locations


# Xorg config directory
export XORGCONFIG="$HOME_LOCAL/share/xorg"

# zsh config
export ZDOTDIR="$HOME_CONFIG/zsh"

export XDG_DATA_HOME="$HOME_LOCAL/share"
export XDG_CONFIG_HOME="$HOME_CONFIG"
export XDG_CACHE_HOME="$HOME_LOCAL/cache"
# Directorio con MIME info, para que abra el torrent por ejemplo.
# Me rompío la cabeza no entender que el xdg-open necesita muchos
# tipos, no solo los que definí en .local/share/applications.
# en los archivos ".desktop" es obligatorio la MimeType="..."
export XDG_DATA_DIRS="/usr/share/:/usr/local/share:$HOME_LOCAL/share/"
export XDG_CONFIG_DIRS="/etc/xdg"

# NeoVim related
export EDITOR="/usr/bin/nvim"
#export VIMRUNTIME="$HOME_LOCAL/share/nvim/runtime"

#VARIABLES PARA EL HISTORIAL
export HISTCONTROL="ignoredups:erasedups"
export HISTSIZE=10000
export HISTFILESIZE=10000

# NODE JS
export NODE_REPL_HISTORY="$HOME_CONFIG/node/node_history"

# Less file history
export LESSHISTFILE="/dev/null"
# Coloring manpages
export MANPAGER="less -R --use-color -Dd+r -Du+b"
export MANROFFOPT="-P -c"

# MPC Library
export MPCLIBRARY="/data/music"

# DMENU font
export dmenu_font="DaddyTimeMono Nerd Font Mono:size=16"

# DOOM WADS
export DOOMWADDIR="/data/games/doom/wads/:/data/games/doom/bkp-wads"

# GPG
export GNUPGHOME="$HOME/.local/.gnupg"

# Timezone
TZ='America/Argentina/Buenos_Aires'
export TZ
