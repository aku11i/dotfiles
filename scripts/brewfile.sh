#!/bin/bash

set -e

brew install \
  bat \
  deno \
  fd ffmpeg fish fnm fx fzf \
  gcc gh ghq gibo git git-delta git-lfs glab go go-task \
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

