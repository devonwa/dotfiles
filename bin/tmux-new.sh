#!/bin/sh

SESSION=$(basename $(pwd))
tmux ls | grep $SESSION && { tmux a -t $SESSION; return 0; }

HAS_NVIM=false
if command -v nvim >/dev/null 2>&1; then
    HAS_NVIM=true
fi
HAS_CLAUDE=false
if command -v claude >/dev/null 2>&1; then
    HAS_CLAUDE=true
fi

# Main window
tmux new-session -d -s $SESSION
tmux split-window -h
tmux split-window -v
tmux select-pane -t 2 # moving right highlights top window first
tmux select-pane -t 1

# Git window
tmux new-window -t $SESSION:2 -n 'git'
tmux send-keys -t 'git' 'lg' C-m

# Editor window
tmux new-window -t $SESSION:3 -n 'vim'
if [ "$HAS_NVIM" = true ]; then
    tmux send-keys -t 'vim' 'nvim' C-m
else
    tmux send-keys -t 'vim' 'vi' C-m
fi

# AI window
if [ "$HAS_CLAUDE" = true ]; then
    tmux new-window -t $SESSION:4 -n 'ai'
    tmux send-keys -t 'ai' 'claude' C-m
fi

tmux attach-session -t $SESSION:1
