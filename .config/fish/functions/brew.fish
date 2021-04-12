function brew -d ""
  if test (/usr/bin/uname) != "Darwin"
    set brew (which brew)
    "$brew" $argv
  else if test (/usr/bin/uname -m) = "arm64"
    echo 'Apple Silicon: /opt/homebrew/bin/brew'
    /opt/homebrew/bin/brew $argv
  else
    echo 'Intel: /usr/local/bin/brew'
    /usr/local/bin/brew $argv
  end
end
