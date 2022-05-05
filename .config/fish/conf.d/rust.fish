# Rust

set -x RUSTUP_HOME $HOME/.rustup
set -x CARGO_HOME $HOME/.cargo

fish_add_path --path $CARGO_HOME/bin

abbr --add --global c 'cargo'
