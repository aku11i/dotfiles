# Homebrew
if test (uname) = "Darwin"
  # Apple Silicon
  fish_add_path /opt/homebrew/bin
end


if test (uname) = "Linux" # Linuxbrew
  set -x PATH /home/linuxbrew/.linuxbrew/bin $PATH
  set -x MANPATH /home/linuxbrew/.linuxbrew/share/man $MANPATH
  set -x INFOPATH /home/linuxbrew/.linuxbrew/share/info $INFOPATH
  set -x XDG_DATA_DIRS /home/linuxbrew/.linuxbrew/share $XDG_DATA_DIRS
end
