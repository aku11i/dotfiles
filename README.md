# dotfiles

![](https://github.com/aktriver/dotfiles/workflows/Docker%20Image%20CI/badge.svg)

## Try

```sh
docker pull docker.pkg.github.com/aktriver/dotfiles/dotfiles:latest
docker run --rm -it docker.pkg.github.com/aktriver/dotfiles/dotfiles:latest
# container size is about 5 GB.
```

### Recommended Color Scheme

Solarized Dark

### Recommended Fonts

- JetBrainsMono Nerd Font<br>
https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip

- Source Code Pro for Powerline Nerd Font (SauceCodePro Nerd Font)<br>
https://github.com/ryanoasis/nerd-fonts/releases/latest/download/SourceCodePro.zip

or [other nerd fonts](https://www.nerdfonts.com/font-downloads)

## Install

Supported Platforms:
- macOS
- Linux(tested on Ubuntu)
- Windows Subsystem for Linux

```sh
git clone https://github.com/aktriver/dotfiles.git ~/.dotfiles
cd ~/.dotfiles

# ./deploy.sh      # Make dotfiles symlinks to Home directory
# ./homebrew.sh    # Install Homebrew (Linuxbrew)
# ./brewfile.sh    # Install brew packages
# ./caskfile.sh    # Install cask packages (macOS only)
```

## Features

### [fish shell](https://github.com/fish-shell/fish-shell)

[config.fish](./.config/fish/config.fish)

- [Fisher](https://github.com/jorgebucaran/fisher) - A package manager for the fish shell.
- [fzf](https://github.com/junegunn/fzf) - A command-line fuzzy finder
- [ghq](https://github.com/x-motemen/ghq) - Remote repository management made easy
  - `Ctrl+G` : Show repositories
- [nvm](https://github.com/nvm-sh/nvm) - Node Version Manager
- [bobthefish](https://github.com/oh-my-fish/theme-bobthefish) - Powerline theme

### [NeoVim](https://github.com/neovim/neovim)

[init.nvim](./.config/nvim/init.vim)

- [vim-plug](https://github.com/junegunn/vim-plug) - Minimalist Vim Plugin Manager
- [fzf.vim](https://github.com/junegunn/fzf.vim)
  - `Ctrl+P` : Search files
  - `Ctrl+G` : Search files recently used
- [coc.nvim](https://github.com/neoclide/coc.nvim) - Intellisense engine for Vim8 & Neovim (Language Server Protocol)
- [vim-airline](https://github.com/vim-airline/vim-airline) - Powerline Plugin
- [NERDTree](https://github.com/preservim/nerdtree) - A tree explorer plugin for vim.
  - `Ctrl+E` : Toggle window
- [surround.vim](https://github.com/tpope/vim-surround) - quoting/parenthesizing made simple
- [fugitive.vim](https://github.com/tpope/vim-fugitive) - A Git wrapper so awesome, it should be illegal

### [Tmux](https://github.com/tmux/tmux)

[.tmux.conf](./.tmux.conf)

- [Powerline](https://github.com/powerline/powerline) - statusline plugin

