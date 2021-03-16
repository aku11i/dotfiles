# Tmux

# Aliases
abbr --add --global t 'tmux'
abbr --add --global ta 'tmux attach'
abbr --add --global td 'tmux detach'
abbr --add --global tn 'tmux new-session -t'
abbr --add --global tN 'tmux detach; and tmux new-session -t'
abbr --add --global tk 'tmux kill-session -t'
abbr --add --global tK 'tmux kill-server'
abbr --add --global tl 'tmux ls'
abbr --add --global ts 'tmux switch-client -t'

# Auto Start
# if [ -z "$TMUX" -a -z "$STY" ]
#   which tmux > /dev/null ;and tmux new-session -t "General" ;and exit # 'exit' may not close fish
# end
