# lazygit
abbr --add --global lg 'lazygit'

function lazygit
  set lazygit (which lazygit)

  if test -z {$lazygit}
    echo "error: lazygit is not found."
    return 1
  end

  if which dark-mode >/dev/null && test (dark-mode status) = "on"
    {$lazygit}
  else
    {$lazygit} --use-config-file ~/.config/lazygit/light.yml
  end
end
