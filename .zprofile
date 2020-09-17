# Default programs:
export FILE="ranger"
export EDITOR="nvim"
export TERMINAL="st"
export BROWSER="brave"
export MYVIMRC="$HOME/.config/nvim/init.vim"

# Auto startx
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
