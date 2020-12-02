export PATH="/opt/homebrew/bin:$PATH"
export PATH="$HOME/.bin:$PATH"

test -e /home/linuxbrew/.linuxbrew/bin/brew && \
  eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
