# Default programs:
export FILE="lfrun"
export EDITOR="nvim"
export TERMINAL="alacritty"
export BROWSER="brave"
export IMAGE="sxiv"
export MYVIMRC="$HOME/.config/nvim/init.vim"

export PATH="$PATH:$(du "$HOME/.local/bin" | cut -f2 | paste -sd ':')"

# Auto startx
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx "$XDG_CONFIG_HOME/X11/xinitrc"
