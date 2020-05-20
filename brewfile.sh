#!/bin/bash

if test "$(uname)" == "Linux"; then
  brew tap linuxbrew/xorg
fi

brew install \
  coreutils \
  ffmpeg \
  fish \
  fx \
  fzf \
  gawk \
  ghq \
  gibo \
  git \
  git-flow \
  git-lfs \
  htop \
  hub \
  imagemagick \
  jq \
  lazydocker \
  lazygit \
  neovim \
  node \
  python \
  ripgrep \
  rsync \
  tig \
  tmux \
  tokei \
  translate-shell \
  tree \
  zsh \



if test "$(uname)" == "Darwin"; then
  brew install \
    cocoapods \

fi

