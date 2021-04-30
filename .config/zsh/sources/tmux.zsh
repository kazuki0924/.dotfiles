alias tmux_3_panes="tmux splitw && tmux splitw -h && tmux resizep -t 0 -y $(expr $(tmux display -p '#{window_height}') / 3)"
