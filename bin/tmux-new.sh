#!/bin/sh

SESSION=$(basename $(pwd))
tmux ls | grep $SESSION && { tmux a -t $SESSION; return 0; }

tmux new-session -d -s $SESSION

tmux split-window -h
tmux split-window -v
tmux select-pane -t 2 # moving right highlights top window first
tmux select-pane -t 1

tmux new-window -t $SESSION:2 -n 'git'
tmux new-window -t $SESSION:3 -n 'vim'

tmux send-keys -t 'vim' 'nvim' C-m
tmux send-keys -t 'vim' 'nvim' C-m
tmux send-keys -t 'git' 'lg' C-m

tmux attach-session -t $SESSION:1
