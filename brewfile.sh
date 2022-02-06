#!/bin/bash

set -e

brew install \
  awscli \
  bat \
  fd ffmpeg fish fnm fx fzf \
  gcc gh ghq gibo git git-delta git-flow git-lfs glab go gron \
  htop \
  imagemagick \
  jenv jq \
  lazydocker lazygit lsd \
  neovim node \
  pastel python \
  rbenv ripgrep rsync rust \
  starship \
  tig tmux tokei translate-shell tree \
  zsh


# GNU utils
brew install \
  binutils coreutils diffutils findutils moreutils \
  gawk gzip gnu-tar gnu-sed gnu-time gnu-getopt


if test "$(uname)" == "Darwin"; then
  brew install \
    cocoapods \
    dark-mode
fi

