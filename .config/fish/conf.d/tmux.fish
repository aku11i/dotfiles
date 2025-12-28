# Tmux

# Aliases
abbr --add --global t 'tmux'
abbr --add --global T 'tmux new-session -A -s main'
abbr --add --global tn 'tmux new-session -A -d -s'
abbr --add --global ta 'tmux attach'
abbr --add --global td 'tmux detach'
abbr --add --global tk 'tmux kill-session -t'
abbr --add --global tK 'tmux kill-server'
abbr --add --global tl 'tmux ls'
abbr --add --global ts 'tmux switch-client -t'

# Key binding: Ctrl-T lists tmux sessions via fzf and switches on Enter
bind \ct tmux_session_fzf
bind -M insert \ct tmux_session_fzf

# Auto Start
# if [ -z "$TMUX" -a -z "$STY" ]
#   which tmux > /dev/null ;and tmux new-session -t "General" ;and exit # 'exit' may not close fish
# end
