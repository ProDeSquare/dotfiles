# Default programs:
export FILE="ranger"
export EDITOR="nvim"
export TERMINAL="st"
export BROWSER="brave"
export MYVIMRC="$HOME/.config/nvim/init.vim"

# Auto startx
if systemctl -q is-active graphical.target && [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
    exec startx
fi
