## .dotfiles

Set of .dotfiles for personal or professional use.

### Dependencies

#### Theme

* [Hack Nerd Font](https://www.nerdfonts.com/font-downloads)
* [Catppuccin Mocha](https://github.com/catppuccin/catppuccin)

#### Shell

* [Zsh](https://www.zsh.org/) 5.9+
* [Powerlevel10k](https://github.com/romkatv/powerlevel10k) or [Starship](https://starship.rs/)
* [Zsh Autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
* [Zsh Syntax Highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)

#### Editor

* [Nvim](https://neovim.io/) 0.10+

#### Terminal

* [Kitty](https://sw.kovidgoyal.net/kitty/)
* [Wezterm](https://wezfurlong.org/wezterm/index.html)
* [Ghostty](https://ghostty.org/)

#### Command-line tools

* [Git](https://git-scm.com/)
* [Fzf](https://github.com/junegunn/fzf)
* [Ripgrep](https://github.com/BurntSushi/ripgrep)
* [Delta](https://github.com/dandavison/delta)
* [Asdf](https://asdf-vm.com/)
* [Zoxide](https://github.com/ajeetdsouza/zoxide)
* [Bat](https://github.com/sharkdp/bat) and [Catppuccin Bat](https://github.com/catppuccin/bat)
* [Tmux](https://github.com/tmux/tmux) and [Tmux Plugin Manager](https://github.com/tmux-plugins/tpm)

#### Tiling Window Managers

* [Aerospace](https://github.com/nikitabobko/AeroSpace) (MacOS)
* [Hyprland](https://hyprland.org/) (Linux)

#### Status bar (Linux only)

* [Hyprpanel](https://hyprpanel.com/)

#### Launcher (Linux only)

* [Walker](https://github.com/abenz1267/walker)

### Example setup (MacOS)

```shell
git clone https://github.com/picadoh/dotfiles.git ~/dotfiles

ln -s ~/dotfiles/.config/tmux ~/.config/tmux
ln -s ~/dotfiles/.config/nvim ~/.config/nvim
ln -s ~/dotfiles/.config/kitty ~/.config/kitty
ln -s ~/dotfiles/.config/wezterm ~/.config/wezterm
ln -s ~/dotfiles/.config/ghostty ~/.config/ghostty
ln -s ~/dotfiles/.config/zsh ~/.config/zsh

echo -e "source ~/.config/zsh/init.zsh" >> ~/.zshrc

echo -e "[include]\n    path = ~/dotfiles/.gitconfig" >> ~/.gitconfig
```

### Additional setup for MacOS only:

```
ln -s ~/dotfiles/.config/aerospace ~/.config/aerospace
```

### Additional setup for Linux only:

```
ln -s ~/dotfiles/.config/hypr ~/.config/hypr
ln -s ~/dotfiles/.config/hyprpanel ~/.config/hyprpanel
```

Requires:
- https://github.com/SimplyCEO/wofi
- https://hyprpanel.com/
- https://wiki.hypr.land/Hypr-Ecosystem/

