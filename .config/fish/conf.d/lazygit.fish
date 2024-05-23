# lazygit
abbr --add --global lg 'lazygit'

function lazygit
  set lazygit (which lazygit)

  if test -z {$lazygit}
    echo "error: lazygit is not found."
    return 1
  end

  if test "$DARK" = "false"
    {$lazygit} --use-config-file ~/.config/lazygit/light.yml  $argv
  else
    {$lazygit} $argv
  end
end
