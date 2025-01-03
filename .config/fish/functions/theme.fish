function theme -d "Set terminal theme"
  set -l theme $argv[1]

  switch $theme
    case "catppuccin-frappe"
      set -Ux THEME "catppuccin-frappe"
      set -Ux DARK "true"
      echo 'general.import = [ "~/.config/alacritty/themes/themes/catppuccin_frappe.toml" ]' > ~/.config/alacritty/theme.toml
    case "catppuccin-latte"
      set -Ux THEME "catppuccin-latte"
      set -Ux DARK "true"
      echo 'general.import = [ "~/.config/alacritty/themes/themes/catppuccin_latte.toml" ]' > ~/.config/alacritty/theme.toml
    case "catppuccin-macchiato"
      set -Ux THEME "catppuccin-macchiato"
      set -Ux DARK "true"
      echo 'general.import = [ "~/.config/alacritty/themes/themes/catppuccin_macchiato.toml" ]' > ~/.config/alacritty/theme.toml
    case "catppuccin-mocha"
      set -Ux THEME "catppuccin-mocha"
      set -Ux DARK "true"
      echo 'general.import = [ "~/.config/alacritty/themes/themes/catppuccin_mocha.toml" ]' > ~/.config/alacritty/theme.toml
    case "everforest-light"
      set -Ux THEME "everforest-light"
      set -Ux DARK "false"
      echo 'general.import = [ "~/.config/alacritty/themes/themes/everforest_light.toml" ]' > ~/.config/alacritty/theme.toml
    case "everforest-dark"
      set -Ux THEME "everforest-dark"
      set -Ux DARK "true"
      echo 'general.import = [ "~/.config/alacritty/themes/themes/everforest_dark.toml" ]' > ~/.config/alacritty/theme.toml
    case "night-owl"
      set -Ux THEME "night-owl"
      set -Ux DARK "true"
      echo 'general.import = [ "~/.config/alacritty/themes/themes/night_owl.toml" ]' > ~/.config/alacritty/theme.toml
    case "nord"
      set -Ux THEME "nord"
      set -Ux DARK "true"
      echo 'general.import = [ "~/.config/alacritty/themes/themes/nord.toml" ]' > ~/.config/alacritty/theme.toml
    case "rose-pine"
      set -Ux THEME "rose-pine"
      set -Ux DARK "true"
      echo 'general.import = [ "~/.config/alacritty/rose-pine/dist/rose-pine.toml" ]' > ~/.config/alacritty/theme.toml
    case "rose-pine-dawn"
      set -Ux THEME "rose-pine-dawn"
      set -Ux DARK "false"
      echo 'general.import = [ "~/.config/alacritty/rose-pine/dist/rose-pine-dawn.toml" ]' > ~/.config/alacritty/theme.toml
    case "rose-pine-moon"
      set -Ux THEME "rose-pine-moon"
      set -Ux DARK "true"
      echo 'general.import = [ "~/.config/alacritty/rose-pine/dist/rose-pine-moon.toml" ]' > ~/.config/alacritty/theme.toml
    case "solarized-dark"
      set -Ux THEME "solarized-dark"
      set -Ux DARK "true"
      echo 'general.import = [ "~/.config/alacritty/themes/themes/solarized_dark.toml" ]' > ~/.config/alacritty/theme.toml
    case "solarized-light"
      set -Ux THEME "solarized-light"
      set -Ux DARK "false"
      echo 'general.import = [ "~/.config/alacritty/themes/themes/solarized_light.toml" ]' > ~/.config/alacritty/theme.toml
    case "tokyo-night"
      set -Ux THEME "tokyo-night"
      set -Ux DARK "true"
      echo 'general.import = [ "~/.config/alacritty/themes/themes/tokyo-night.toml" ]' > ~/.config/alacritty/theme.toml
    case "tokyo-night-storm"
      set -Ux THEME "tokyo-night-storm"
      set -Ux DARK "true"
      echo 'general.import = [ "~/.config/alacritty/themes/themes/tokyo-night-storm.toml" ]' > ~/.config/alacritty/theme.toml
  end
end

set themes 

complete -c theme \
  -xa "\
        catppuccin-frappe \
        catppuccin-latte \
        catppuccin-macchiato \
        catppuccin-mocha \
        everforest-light \
        everforest-dark \
        night-owl \
        nord \
        rose-pine \
        rose-pine-dawn \
        rose-pine-moon \
        solarized-dark \
        solarized-light \
        tokyo-night \
        tokyo-night-storm \
      " \
  -d "Available themes"
