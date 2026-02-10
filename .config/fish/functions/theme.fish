function theme -d "Set terminal theme"
  set -l theme $argv[1]

  # Define theme configurations: <name> <is_dark>
  set -l themes \
    "catppuccin-frappe" "true" \
    "catppuccin-latte" "false" \
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
  set -Ux THEME $theme
  set -Ux DARK $themes[(math $index + 1)]

  # Update Claude theme
  if command -q jq; and test -f ~/.claude.json
    set -l claude_theme dark
    if test "$DARK" != "true"
      set claude_theme light
    end
    set -l tmp (mktemp)
    jq --arg t $claude_theme '.theme = $t' ~/.claude.json >$tmp && mv $tmp ~/.claude.json
  end

  # Update delta theme
  if test "$DARK" = "true"
    set -Ux DELTA_FEATURES "$THEME dark"
  else
    set -Ux DELTA_FEATURES "$THEME light"
  end

  # Update lazygit theme
  if test "$THEME" = "iceberg"
    set -Ux LG_CONFIG_FILE "$HOME/.config/lazygit/config.yml,$HOME/.config/lazygit/dark.yml,$HOME/.config/lazygit/iceberg-dark.yml"
  else if test "$THEME" = "iceberg-light"
    set -Ux LG_CONFIG_FILE "$HOME/.config/lazygit/config.yml,$HOME/.config/lazygit/light.yml,$HOME/.config/lazygit/iceberg-light.yml"
  else if test "$DARK" = "true"
    set -Ux LG_CONFIG_FILE "$HOME/.config/lazygit/config.yml,$HOME/.config/lazygit/dark.yml"
  else
    set -Ux LG_CONFIG_FILE "$HOME/.config/lazygit/config.yml,$HOME/.config/lazygit/light.yml"
  end
end



# Set up tab completion
complete -c theme -xa "(theme)" -d "Available themes"

