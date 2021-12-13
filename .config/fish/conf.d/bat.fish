
function bat
  set bat (which bat)

  if test -z {$bat}
    echo "error: bat is not found."
    return 1
  end

  if which dark-mode >/dev/null && test (dark-mode status) = "on"
    {$bat} --theme "Solarized (dark)" $argv
  else
    {$bat} --theme "Solarized (light)" $argv
  end
end

