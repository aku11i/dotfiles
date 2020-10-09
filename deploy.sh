#!/bin/bash
cd `dirname $0`

set -e

function deploy() {
  if test -f "$1"; then
    src=$(pwd)/$1
    dest=$HOME/$1
    ln -svnf $src $dest
  fi

  if test -d "$1"; then
    test -d $HOME/$1 || mkdir -p $HOME/$1
    for f in $(find $1 -maxdepth 1 ! -path $1); do
      deploy $f
    done
  fi
}

for dotfile in .??* ; do
  [[ $dotfile == .git* ]] && continue
  [[ $dotfile == .DS_Store ]] && continue
  deploy $dotfile
done

# chmod +x $HOME/.bin/*
