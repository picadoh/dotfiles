# general
alias ll='ls -lhaG'

# history
export HISTTIMEFORMAT='%y-%m-%d  '
export HISTCONTROL=ignoredups:erasedups
export HISTIGNORE="history:uptime"
export HISTSIZE=50000
setopt histappend

# theme
export BAT_THEME="Catppuccin Mocha"

# keys
bindkey "^[[A" history-search-backward
bindkey "^[[B" history-search-forward

# editor
export EDITOR='nvim'

# fzf
source <(fzf --zsh)
FZF_DEFAULT_COMMAND='ag -g ""'

# gpg
export GPG_TTY="$(tty)"

