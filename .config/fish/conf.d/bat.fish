
function bat
  if not command -sq bat
    echo "error: bat is not found."
    return 1
  end

  if type -q dark-mode; and test (dark-mode status) = "on"
    command bat --theme "Monokai Extended" $argv
  else
    command bat --theme "Solarized (light)" $argv
  end
end
