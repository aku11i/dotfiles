#!/bin/bash

echo "Preparing to install Homebrew..."

# Debian
if test -e "$(which apt)"; then
  sudo apt update
  sudo apt install -y build-essential curl file git
fi

echo "Installing Homebrew..."

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

echo "Finishing to install Homebrew..."

# Linux
if test "$(uname)" == "Linux"; then
  test -d ~/.linuxbrew && eval $(~/.linuxbrew/bin/brew shellenv)
  test -d /home/linuxbrew/.linuxbrew && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
  test -r ~/.bash_profile && echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.bash_profile
  echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.profile
fi

