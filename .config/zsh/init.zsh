# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# theme
[[ ! -d $HOME/powerlevel10k ]] || source ~/powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f $HOME/.p10k.zsh ]] || source ~/.p10k.zsh

# syntax highlighting and suggestions
if command -v brew > /dev/null; then
  source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
  source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
else
  ZSH_HIGHLIGHT_LINUX=/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
  [[ ! -f $ZSH_HIGHLIGHT_LINUX ]] || source $ZSH_HIGHLIGHT_LINUX
  ZSH_AUTOSUGGESTIONS_LINUX=/usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
  [[ ! -f $ZSH_AUTOSUGGESTIONS_LINUX ]] || source $ZSH_AUTOSUGGESTIONS_LINUX
fi

ZSH_HIGHLIGHT_STYLES[path]=none
ZSH_HIGHLIGHT_STYLES[path_prefix]=none

# zoxide
if command -v zoxide > /dev/null; then
  eval "$(zoxide init zsh)"
  alias cd=z
fi

# asdf
if command -v asdf > /dev/null; then
  export PATH="$HOME/.asdf/bin:$PATH"
  export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"
fi

if [[ -f $HOME/.asdf/plugins/java/set-java-home.zsh ]]; then
  source $HOME/.asdf/plugins/java/set-java-home.zsh
fi

# rc.d files
for f in ~/.config/zsh/rc.d/*.zsh(.N); do source "$f"; done

# compinit
autoload -Uz compinit
compinit

# zstyle
zstyle ':completion:*' completer _complete
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' '+l:|=* r:|=*'

# path
export PATH="/usr/local/sbin:$PATH"


###########
# env var #
###########

# general
alias ll='ls -lhaG'

# history
export HISTTIMEFORMAT='%y-%m-%d  '
export HISTCONTROL=ignoredups:erasedups
export HISTFILE=$HOME/.zsh_history
export HISTSIZE=50000
export SAVEHIST=50000
setopt appendhistory

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


###########
# aliases #
###########

# editor
alias vim='nvim'
alias vi='nvim'

# interactive search / open nvim 
alias fim='nvim $(fzf -m --preview="bat --color=always {}")'

# k8s
alias k='kubectl'

# docker
alias docker-compose='docker compose'
alias dtree="docker run -it --rm -v /var/run/docker.sock:/var/run/docker.sock nate/dockviz images -t"
alias dins='docker inspect -f'

# localstack
alias awslocal='aws --endpoint-url http://localhost:4566'

# misc
alias wget='wget -c'
alias so='source ~/.zshrc'
alias ag='ag --hidden'

# delta
if command -v delta > /dev/null; then
  alias diff='delta'
fi

