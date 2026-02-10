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
    "iceberg" "true" \
    "iceberg-light" "false" \
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
  set -gx THEME $theme
  set -Ux THEME $theme
  set -gx DARK $themes[(math $index + 1)]
  set -Ux DARK $themes[(math $index + 1)]

  # Update Claude theme if command exists
  if command -q claude
    if test "$DARK" = "true"
      claude config set --global theme dark >/dev/null 2>&1; or claude config set theme dark >/dev/null 2>&1
    else
      claude config set --global theme light >/dev/null 2>&1; or claude config set theme light >/dev/null 2>&1
    end
  end

  # Update delta theme
  if test "$DARK" = "true"
    set -gx DELTA_FEATURES "$THEME dark"
    set -Ux DELTA_FEATURES "$THEME dark"
  else
    set -gx DELTA_FEATURES "$THEME light"
    set -Ux DELTA_FEATURES "$THEME light"
  end

  # Update lazygit theme
  if test "$THEME" = "iceberg"
    set -gx LG_CONFIG_FILE "$HOME/.config/lazygit/config.yml,$HOME/.config/lazygit/dark.yml,$HOME/.config/lazygit/iceberg-dark.yml"
    set -Ux LG_CONFIG_FILE "$HOME/.config/lazygit/config.yml,$HOME/.config/lazygit/dark.yml,$HOME/.config/lazygit/iceberg-dark.yml"
  else if test "$THEME" = "iceberg-light"
    set -gx LG_CONFIG_FILE "$HOME/.config/lazygit/config.yml,$HOME/.config/lazygit/light.yml,$HOME/.config/lazygit/iceberg-light.yml"
    set -Ux LG_CONFIG_FILE "$HOME/.config/lazygit/config.yml,$HOME/.config/lazygit/light.yml,$HOME/.config/lazygit/iceberg-light.yml"
  else if test "$DARK" = "true"
    set -gx LG_CONFIG_FILE "$HOME/.config/lazygit/config.yml,$HOME/.config/lazygit/dark.yml"
    set -Ux LG_CONFIG_FILE "$HOME/.config/lazygit/config.yml,$HOME/.config/lazygit/dark.yml"
  else
    set -gx LG_CONFIG_FILE "$HOME/.config/lazygit/config.yml,$HOME/.config/lazygit/light.yml"
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
