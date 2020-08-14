#!/bin/bash

if test "$(uname)" == "Linux"; then
  brew tap linuxbrew/xorg
fi

brew install \
  ffmpeg \
  fish \
  fx \
  fzf \
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


# GNU utils
brew install \
  binutils \
  coreutils \
  diffutils \
  findutils \
  moreutils \
  gawk \
  gzip \
  gnu-tar \
  gnu-sed \
  gnu-time \
  gnu-getopt


if test "$(uname)" == "Darwin"; then
  brew install \
    cocoapods \

fi

