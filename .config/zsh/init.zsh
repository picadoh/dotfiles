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
  export PATH="$HOME/.asdf/shims:$PATH"
  export PATH="$HOME/.asdf/bin:$PATH"
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

