# ~/.bash_profile

[[ -f ~/.bashrc ]] && . ~/.bashrc
[[ -d ~/.local/bin ]] && PATH="$HOME/.local/bin:$PATH"
[[ -d ~/.local/scripts ]] && PATH="$(du "/home/test/.local/scripts" | cut -f2 | tr '\n' ':' | sed 's/:*$//'):/usr/lib/jvm/java-11-openjdk/bin/:$PATH"


## PARA QUE EL FAF LEVANTE LA VERSION CORRECTA DE JAVA
#export PATH="/usr/lib/jvm/java-14-openjdk/bin/:$PATH"
#export INSTALL4J_JAVA_HOME="/usr/lib/jvm/java-14-openjdk/bin/:$PATH"

# Terminal
export TERMINAL="alacritty"
export BROWSER="brave"

# Colores
export BOLD="$(tput bold)"
export BLACK="$(tput setaf 0)"
export RED="$(tput setaf 1)"
export GREEN="$(tput setaf 2)"
export YELLOW="$(tput setaf 3)"
export BLUE="$(tput setaf 4)"
export MAGENTA="$(tput setaf 5)"
export CYAN="$(tput setaf 6)"
export WHITE="$(tput setaf 7)"
export DIM="$(tput dim)"
export NC="$(tput sgr0)"


# Most commonly used paths
export HOME="/home/test"
export HOME_CONFIG="$HOME/.config"
export HOME_LOCAL="$HOME/.local"
export HOME_SCRIPTS="$HOME_LOCAL/scripts"
export HOME_ICONS="$HOME_LOCAL/icons"
export DWMBAR="$HOME_CONFIG/dwmbar"
export LOGS="$HOME_LOCAL/my_logs"

# Xorg config directory
export XORGCONFIG="$HOME_LOCAL/share/xorg"


export XDG_DATA_HOME="$HOME_LOCAL/share"
export XDG_CONFIG_HOME="$HOME_CONFIG"
export XDG_CACHE_HOME="$HOME_LOCAL/cache"
# Directorio con MIME info, para que abra el torrent por ejemplo.
# Me rompío la cabeza no entender que el xdg-open necesita muchos
# tipos, no solo los que definí en .local/share/applications.
export XDG_DATA_DIRS="/usr/share/:/usr/local/share:$HOME_LOCAL/share/"
#export XDG_DATA_DIRS=/usr/share/:/usr/local/share:$HOME_LOCAL/share/
export XDG_CONFIG_DIRS="/etc/xdg"

# NeoVim related
export EDITOR="/usr/bin/nvim"
export VIMRUNTIME="$HOME/.local/share/nvim/runtime"

#VARIABLES PARA EL HISTORIAL
export HISTCONTROL="ignoredups:erasedups"
export HISTSIZE=10000
export HISTFILESIZE=10000

# Less file history
export LESSHISTFILE="/dev/null"

# MPC Library
export MPCLIBRARY="/data/music"

# DMENU font
export dmenu_font="monospace-16"

# DOOM WADS
export DOOMWADDIR="/data/games/doom/wads/:/data/games/doom/bkp-wads"
