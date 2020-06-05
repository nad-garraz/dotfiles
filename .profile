# ~/.bash_profile

[[ -f ~/.bashrc ]] && . ~/.bashrc
[[ -d ~/.local/bin ]] && PATH="$HOME/.local/bin:$PATH"
[[ -d ~/.local/scripts ]] && PATH="$(du "/home/test/.local/scripts" | cut -f2 | tr '\n' ':' | sed 's/:*$//'):$PATH"

# Terminal
export TERMINAL="alacritty"
export BROWSER="brave"

# dwmbar
export SEP1='['
export SEP2=']'

# Colores
export BOLD="$(tput bold)"
export RED="$(tput setaf 1)"
export GREEN="$(tput setaf 2)"
export BLUE="$(tput setaf 4)"
export CYAN="$(tput setaf 6)"
export NC="$(tput sgr0)"
export MAGENTA="$(tput setaf 5)"
export DIM="$(tput dim)"


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
# Esta variable es muy importante para mi saludo mental
export XDG_DATA_DIRS="$XDG_DATA_HOME:$XDG_DATA_DIRS:/usr/share"
export XDG_CONFIG_DIRS="/etc/xdg"

# NeoVim realted
export EDITOR="$HOME/.local/bin/nvim"
export VIMRUNTIME="$HOME/.local/share/nvim/runtime"

# Tiempo de loop
export LOOP_TIME="10"

#VARIABLES PARA EL HISTORIAL
export HISTCONTROL="ignoredups:erasedups"
export HISTSIZE=10000
export HISTFILESIZE=10000

# PARA QUE EL FAF LEVANTE LA VERSION CORRECTA DE JAVA
export PATH="/usr/lib/jvm/java-13-openjdk/bin/:$PATH"

# Less file history
export LESSHISTFILE="/dev/null"
