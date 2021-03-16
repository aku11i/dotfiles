# Homebrew
if test (uname) = "Darwin"
  # Apple Silicon
  fish_add_path /opt/homebrew/bin

  # GNU utils
  fish_add_path /usr/local/opt/binutils/libexec/gnubin
  fish_add_path /usr/local/opt/coreutils/libexec/gnubin
  fish_add_path /usr/local/opt/diffutils/libexec/gnubin
  fish_add_path /usr/local/opt/findutils/libexec/gnubin
  fish_add_path /usr/local/opt/moreutils/libexec/gnubin
  fish_add_path /usr/local/opt/gawk/libexec/gnubin
  fish_add_path /usr/local/opt/gzip/libexec/gnubin
  fish_add_path /usr/local/opt/gnu-tar/libexec/gnubin
  fish_add_path /usr/local/opt/gnu-sed/libexec/gnubin
  fish_add_path /usr/local/opt/gnu-time/libexec/gnubin
  fish_add_path /usr/local/opt/gnu-getopt/libexec/gnubin

  # Prioritize /usr/bin/uname over /usr/local/opt/coreutils/libexec/gnubin/uname
  abbr uname '/usr/bin/uname'
end


if test (uname) = "Linux" # Linuxbrew
  set -x PATH /home/linuxbrew/.linuxbrew/bin $PATH
  set -x MANPATH /home/linuxbrew/.linuxbrew/share/man $MANPATH
  set -x INFOPATH /home/linuxbrew/.linuxbrew/share/info $INFOPATH
  set -x XDG_DATA_DIRS /home/linuxbrew/.linuxbrew/share $XDG_DATA_DIRS
end
