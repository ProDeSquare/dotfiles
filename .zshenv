export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

export LESSHISTFILE="-"

export ZDOTDIR="${XDG_CONFIG_HOME:-$HOME/.config}/zsh"
export ANDROID_SDK_HOME="${XDG_CONFIG_HOME:-$HOME/.config}/android"
export GOPATH="${XDG_DATA_HOME:-$HOME/.local/share}/go"
export XINITRC="${XDG_CONFIG_HOME:-$HOME/.config}"/X11/xinitrc
export XSERVERRC="${XDG_CONFIG_HOME:-$HOME/.config}"/X11/xserverrc
export HISTFILE="${XDG_DATA_HOME:-$HOME/.local/share}/histfile"
