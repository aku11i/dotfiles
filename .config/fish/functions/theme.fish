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
    case "solarized-dark"
      set -Ux THEME "solarized-dark"
      echo 'import = [ "~/.config/alacritty/themes/themes/solarized_dark.toml" ]' > ~/.config/alacritty/theme.toml
      alacritty msg config --reset
    case "solarized-light"
      set -Ux THEME "solarized-light"
      echo 'import = [ "~/.config/alacritty/themes/themes/solarized_light.toml" ]' > ~/.config/alacritty/theme.toml
      alacritty msg config --reset
  end
end

complete -c theme \
 -xa "nord night-owl solarized-dark solarized-light" \
 -d "Available themes"
