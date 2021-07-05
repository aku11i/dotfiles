#!/bin/bash

set -e

brew install \
  bat \
  fd ffmpeg fish fnm fx fzf \
  gcc ghq gibo git git-delta git-flow git-lfs gron \
  htop hub \
  imagemagick \
  jq \
  lab lazydocker lazygit lsd \
  neovim node \
  pastel python \
  ripgrep rsync \
  tig tmux tokei translate-shell tree \
  zsh


# GNU utils
brew install \
  binutils coreutils diffutils findutils moreutils \
  gawk gzip gnu-tar gnu-sed gnu-time gnu-getopt


if test "$(uname)" == "Darwin"; then
  brew install \
    cocoapods
fi

