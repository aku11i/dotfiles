function tmux_session_fzf
    if not type -q tmux
        return 1
    end

    if not type -q fzf
        return 1
    end

    set -l target (tmux list-sessions -F '#S' 2>/dev/null | fzf --prompt="tmux> " --height=40% --border --exit-0 \
        --preview 'for w in (tmux list-windows -t {} -F "#I"); tmux display -pt {}:$w "#I:#W#{?window_active,*,} #{window_panes} panes"; tmux list-panes -t {}:$w -F "  #I.#P #{pane_current_command} #{pane_title}"; echo; end')
    if test -z "$target"
        commandline -f repaint
        return 0
    end

    if set -q TMUX
        tmux switch-client -t "$target"
    else
        tmux attach -t "$target"
    end

    commandline -f repaint
end
