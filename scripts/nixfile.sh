#!/bin/bash

set -e

nix profile install \
  nixpkgs#actionlint \
  nixpkgs#awscli2 \
  nixpkgs#bat \
  nixpkgs#devenv \
  nixpkgs#delta \
  nixpkgs#direnv \
  nixpkgs#fd \
  nixpkgs#ffmpeg \
  nixpkgs#fish \
  nixpkgs#fzf \
  nixpkgs#gcc \
  nixpkgs#gh \
  nixpkgs#ghq \
  nixpkgs#git \
  nixpkgs#go \
  nixpkgs#go-task \
  nixpkgs#htop \
  nixpkgs#imagemagick \
  nixpkgs#jq \
  nixpkgs#lazydocker \
  nixpkgs#lazygit \
  nixpkgs#lsd \
  nixpkgs#neovim \
  nixpkgs#nodejs_24 \
  nixpkgs#pastel \
  nixpkgs#pnpm \
  nixpkgs#python3 \
  nixpkgs#ripgrep \
  nixpkgs#rsync \
  nixpkgs#starship \
  nixpkgs#tig \
  nixpkgs#tmux \
  nixpkgs#tokei \
  nixpkgs#tree \
  nixpkgs#zsh

nix profile install \
  nixpkgs#binutils \
  nixpkgs#coreutils \
  nixpkgs#diffutils \
  nixpkgs#findutils \
  nixpkgs#moreutils \
  nixpkgs#gawk \
  nixpkgs#gzip \
  nixpkgs#gnutar \
  nixpkgs#gnused \
  nixpkgs#time \
  nixpkgs#getopt
