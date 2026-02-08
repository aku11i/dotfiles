function theme -d "Set terminal theme"
  set -l theme $argv[1]

  # Define theme configurations: <name> <is_dark>
  set -l themes \
    "catppuccin-frappe" "true" \
    "catppuccin-latte" "true" \
    "catppuccin-macchiato" "true" \
    "catppuccin-mocha" "true" \
    "everforest-light" "false" \
    "everforest-dark" "true" \
    "night-owl" "true" \
    "nord" "true" \
    "nord-light" "false" \
    "rose-pine" "true" \
    "rose-pine-dawn" "false" \
    "rose-pine-moon" "true" \
    "solarized-dark" "true" \
    "solarized-light" "false" \
    "tokyo-night" "true" \
    "tokyo-night-storm" "true" \
    "zenburn" "true"

  # Build available themes list for completion
  set -l available_themes
  for i in (seq 1 2 (count $themes))
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

# Delta theme
if test "$DARK" = "true"
  set -Ux DELTA_FEATURES "$THEME dark"
else
  set -Ux DELTA_FEATURES "$THEME light"
end
