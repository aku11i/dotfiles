#!/bin/bash
cd `dirname $0`

set -e

brokenSymlinks=("
  $(find "$HOME"         -mindepth 1 -maxdepth 1 -xtype l)
  $(find "$HOME/.config" -mindepth 1 -maxdepth 3 -xtype l)
")

if test ${#array[@]} -eq "0"; then
  exit 0
fi

echo "$brokenSymlinks"

for link in $brokenSymlinks; do
  test -e "$link" && continue
  rm -i "$link"
done


