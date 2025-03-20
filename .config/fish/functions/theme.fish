function theme -d "Set terminal theme"
  set -l theme $argv[1]

  # Define theme configurations
  set -l themes \
    "catppuccin-frappe" "true" "~/.config/alacritty/themes/themes/catppuccin_frappe.toml" \
    "catppuccin-latte" "true" "~/.config/alacritty/themes/themes/catppuccin_latte.toml" \
    "catppuccin-macchiato" "true" "~/.config/alacritty/themes/themes/catppuccin_macchiato.toml" \
    "catppuccin-mocha" "true" "~/.config/alacritty/themes/themes/catppuccin_mocha.toml" \
    "everforest-light" "false" "~/.config/alacritty/themes/themes/everforest_light.toml" \
    "everforest-dark" "true" "~/.config/alacritty/themes/themes/everforest_dark.toml" \
    "night-owl" "true" "~/.config/alacritty/themes/themes/night_owl.toml" \
    "nord" "true" "~/.config/alacritty/themes/themes/nord.toml" \
    "rose-pine" "true" "~/.config/alacritty/rose-pine/dist/rose-pine.toml" \
    "rose-pine-dawn" "false" "~/.config/alacritty/rose-pine/dist/rose-pine-dawn.toml" \
    "rose-pine-moon" "true" "~/.config/alacritty/rose-pine/dist/rose-pine-moon.toml" \
    "solarized-dark" "true" "~/.config/alacritty/themes/themes/solarized_dark.toml" \
    "solarized-light" "false" "~/.config/alacritty/themes/themes/solarized_light.toml" \
    "tokyo-night" "true" "~/.config/alacritty/themes/themes/tokyo-night.toml" \
    "tokyo-night-storm" "true" "~/.config/alacritty/themes/themes/tokyo-night-storm.toml"

  # Build available themes list for completion
  set -l available_themes
  for i in (seq 1 3 (count $themes))
    set -a available_themes $themes[$i]
  end

  # Check if theme is valid
  if not contains -- $theme $available_themes
    for t in $available_themes
      echo "$t"
    end
    return 1
  end

  # Apply the selected theme
  set -l index (contains -i -- $theme $themes)
  set -Ux THEME $theme
  set -Ux DARK $themes[(math $index + 1)]

  # Update alacritty config
  set -l theme_path $themes[(math $index + 2)]
  echo "general.import = [ \"$theme_path\" ]" > ~/.config/alacritty/theme.toml

  # Update Claude theme if command exists
  if command -q claude
    if test "$DARK" = "true"
      claude config set --global theme dark
    else
      claude config set --global theme light
    end
  end

  # Update delta theme
  set -Ux DELTA_FEATURES $THEME

  # Update lazygit theme
  if test "$DARK" = "true"
    set -Ux LG_CONFIG_FILE "$HOME/.config/lazygit/config.yml,$HOME/.config/lazygit/dark.yml"
  else
    set -Ux LG_CONFIG_FILE "$HOME/.config/lazygit/config.yml,$HOME/.config/lazygit/light.yml"
  end
end



# Set up tab completion
complete -c theme -xa "(theme)" -d "Available themes"
