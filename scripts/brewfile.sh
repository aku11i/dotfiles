#!/bin/bash

set -e

brew install \
  bat \
  fd ffmpeg fish fzf \
  gcc gh ghq git git-delta go go-task \
  htop \
  imagemagick \
  jq \
  lazydocker lazygit lsd \
  neovim node \
  pastel python \
  ripgrep rsync \
  starship \
  tig tmux tokei tree \
  zsh


# GNU utils
brew install \
  binutils coreutils diffutils findutils moreutils \
  gawk gzip gnu-tar gnu-sed gnu-time gnu-getopt


if test "$(uname)" == "Darwin"; then
  brew install \
    dark-mode
fi

