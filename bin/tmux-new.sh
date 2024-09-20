#!/bin/sh

SESSION=$(basename $(pwd))

tmux new-session -d -s $SESSION

tmux rename-window -t 1 'git'
tmux new-window -t $SESSION:2 -n 'vim'
tmux new-window -t $SESSION:3

tmux send-keys -t 'git' 'lg' C-m
tmux send-keys -t 'vim' 'nvim' C-m

tmux attach-session -t $SESSION:3
