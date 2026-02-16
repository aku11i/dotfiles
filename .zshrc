export PATH="/opt/homebrew/bin:$PATH"
export PATH="$HOME/.bin:$PATH"

test -e /home/linuxbrew/.linuxbrew/bin/brew \
  && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)

test -e /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh \
  && . /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh

eval "$(direnv hook zsh)"
