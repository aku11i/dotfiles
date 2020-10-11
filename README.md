# dotfiles

![](https://github.com/aktriver/dotfiles/workflows/Publish%20to%20docker.pkg.github.com/badge.svg)

## Try on Docker

```sh
docker pull docker.pkg.github.com/aktriver/dotfiles/dotfiles:latest
docker run --rm -it docker.pkg.github.com/aktriver/dotfiles/dotfiles:latest
# container size is several GB.
```

### Recommended Terminal Color Scheme

[Rigel](https://github.com/rigellute/rigel)

### Recommended Fonts

- JetBrainsMono Nerd Font<br>
  https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip
- Source Code Pro for Powerline Nerd Font (SauceCodePro Nerd Font)<br>
  https://github.com/ryanoasis/nerd-fonts/releases/latest/download/SourceCodePro.zip

or [other nerd fonts](https://www.nerdfonts.com/font-downloads)

## Install

Supported Platforms:
- macOS
- Linux(tested on Ubuntu/Debian)
- Windows Subsystem for Linux

```sh
git clone https://github.com/aktriver/dotfiles.git ~/.dotfiles
cd ~/.dotfiles

# ./deploy.sh      # Make dotfiles symlinks to Home directory
# ./homebrew.sh    # Install Homebrew (Linuxbrew)
# ./brewfile.sh    # Install brew packages
# ./caskfile.sh    # Install cask packages (macOS only)
```

