# Hamza Mughal's config of zsh

# loading colors
autoload -U colors && colors

# VCS info
autoload -Uz vcs_info
precmd() { vcs_info }
setopt prompt_subst
zstyle ':vcs_info:*' enable git svn
zstyle ':vcs_info:git:*' formats "%{$fg[magenta]%}%s:(%{$fg[green]%}%b%{$fg[magenta]%})%{$reset_color%} "

# sourcing the prompt file
source ~/.config/zsh/promptrc

# Autocompletion
autoload -Uz compinit
compinit
zstyle ':completion:*' menu select
setopt COMPLETE_ALIASES

# History search
bindkey '\e[A' history-search-backward
bindkey '\e[B' history-search-forward

# Checking for histfile in the home dir (create if doesn't exists)
[ -f $HISTFILE ] || touch $HISTFILE

# Specifying the histfile, history should be saved here
HISTFILE=$HISTFILE
HISTSIZE=10000
SAVEHIST=10000

# Customizing the way history behaves
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE

# Exports
export BROWSER="brave"
export EDITOR="nvim"

# Basic alias configs
alias ls='ls --color=auto'
alias grep='grep --colour=auto'
alias egrep='egrep --colour=auto'
alias fgrep='fgrep --colour=auto'

# Completion setup
zmodload zsh/complist
autoload -Uz compinit
compinit
zstyle :compinstall filename '${HOME}/.zshrc'

# Completion for pacman (press tab to list package names)
zstyle ':completion:*:pacman:*' force-list always
zstyle ':completion:*:*:pacman:*' menu yes select

zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# Completion for kill command
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*'   force-list always

# Completion of killall command
zstyle ':completion:*:*:killall:*' menu yes select
zstyle ':completion:*:killall:*'   force-list always

# Edit command in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# Fish like syntax highlight
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null

# Fish like command completion
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#928374,bg=#282828,underline"

# Auto cd (i don't use this one too most of the time)
setopt autocd

# Loading the alias file
[ -f $HOME/.config/shell/aliasrc ] && source ~/.config/shell/aliasrc

# Loading the path file
[ -f $HOME/.config/shell/pathrc ] && source ~/.config/shell/pathrc

# Sysinfo
# echo '\n' && sysinfo && echo '\n'
# /opt/shell-color-scripts/colorscript.sh random
echo; echo; seq 1 $(tput cols) | sort -R | spark | lolcat; echo; echo
