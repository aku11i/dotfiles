#!/bin/bash
cd `dirname $0`

set -e

brokenSymlinks=("
$(find "$HOME"         -mindepth 1 -maxdepth 1 -type l -exec test ! -e {} \; -print)
$(find "$HOME/.bin" -mindepth 1 -maxdepth 3 -type l -exec test ! -e {} \; -print)
$(find "$HOME/.config" -mindepth 1 -maxdepth 3 -type l -exec test ! -e {} \; -print)
")

if test ${#brokenSymlinks[@]} -eq "0"; then
  echo 'No broken symbolic links are found.'
  exit 0
fi

echo "Broken symbolic links are found:"
echo "$brokenSymlinks"

for link in $brokenSymlinks; do
  rm -i "$link"
done

