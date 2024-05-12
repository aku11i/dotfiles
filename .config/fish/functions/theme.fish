function theme -d "Set terminal theme"
  set -l theme $argv[1]

  switch $theme
    case "nord"
      set -Ux THEME "nord"
      echo 'import = [ "~/.config/alacritty/themes/themes/nord.toml" ]' > ~/.config/alacritty/theme.toml
      alacritty msg config --reset
    case "night-owl"
      set -Ux THEME "night-owl"
      echo 'import = [ "~/.config/alacritty/themes/themes/night_owl.toml" ]' > ~/.config/alacritty/theme.toml
      alacritty msg config --reset
  end
end

# complete -c theme -a 'nord night-owl' -d 'Choose a theme'

complete -c theme -xa "nord night-owl" -d "Available themes"
