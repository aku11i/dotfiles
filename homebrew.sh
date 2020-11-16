#!/bin/bash

set -e

# Debian
if test -e "$(which apt)"; then
  sudo apt update
  sudo apt install -y build-essential curl file git
fi

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# Linux
if test "$(uname)" == "Linux"; then
  echo 'eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)' >> /home/main/.profile
  eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
fi

