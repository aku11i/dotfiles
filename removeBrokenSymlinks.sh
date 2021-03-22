#!/bin/bash
cd `dirname $0`

set -e

brokenSymlinks=( $(find "$HOME" -maxdepth 1 -type l) )

dirs=("$HOME/.config" "$HOME/.bin")
for dir in $dirs; do
  test -d "$dir" || continue
  brokenSymlinks=(${array[@]} $(find "$dir" -maxdepth 3 -xtype l) )
done

for link in $brokenSymlinks; do
  test -e "$link" && continue
  rm -i "$link"
done


