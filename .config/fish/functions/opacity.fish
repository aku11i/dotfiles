function opacity -d "Set terminal opacity"
  set -l opacity $argv[1]

  if string match -qr '^[0-9]*\.?[0-9]+$' $opacity
    alacritty msg config "window.opacity=$opacity"
  else
    echo "Usage: opacity <0-1>"
  end
end
