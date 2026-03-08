# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# theme
[[ ! -d $HOME/powerlevel10k ]] || source ~/powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f $HOME/.p10k.zsh ]] || source ~/.p10k.zsh


# Optimization: Ensure path variables only contain unique values
typeset -U path PATH fpath FPATH

# Optimization: Hardcoded Homebrew path
BREW_PREFIX="/usr/local"

# Homebrew environment variables
export HOMEBREW_NO_INSTALL_CLEANUP=1
export HOMEBREW_NO_ENV_HINTS=1

# syntax highlighting and suggestions
if [[ -d "$BREW_PREFIX" ]]; then
  source "$BREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
  source "$BREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
fi

ZSH_HIGHLIGHT_STYLES[path]=none
ZSH_HIGHLIGHT_STYLES[path_prefix]=none

# zoxide initialization with caching
if [[ -z "$CLAUDE_CODE" ]]; then
  if command -v zoxide > /dev/null; then
    ZOXIDE_CACHE="${XDG_CACHE_HOME:-$HOME/.cache}/zoxide-init.zsh"
    if [[ ! -f "$ZOXIDE_CACHE" ]]; then
      zoxide init zsh > "$ZOXIDE_CACHE"
    fi
    source "$ZOXIDE_CACHE"
    alias cd=z
  fi
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

# Optimization: Faster compinit
autoload -Uz compinit
if [[ -n ${ZDOTDIR:-$HOME}/.zcompdump(#qN.m-1) ]]; then
  compinit -C
else
  compinit
fi

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
bindkey "^A" beginning-of-line
bindkey "^E" end-of-line
bindkey "^[[1;3C" forward-word
bindkey "^[[1;3D" backward-word

# editor
export EDITOR='nvim'

# fzf initialization with caching
if command -v fzf > /dev/null; then
  FZF_CACHE="${XDG_CACHE_HOME:-$HOME/.cache}/fzf-init.zsh"
  if [[ ! -f "$FZF_CACHE" ]]; then
    fzf --zsh > "$FZF_CACHE"
  fi
  source "$FZF_CACHE"
fi
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

# Performance Optimization: Auto-compile configuration files
() {
  local f
  for f in "$HOME/.zshrc" "$HOME/.config/zsh/init.zsh"; do
    if [[ "$f" -nt "$f.zwc" ]]; then
      zcompile "$f"
    fi
  done
}
