#!/bin/bash


current_pane_id=$(tmux display-message -p "#{pane_id}")
current_pane_id=${current_pane_id:1}
tmux select-pane -D
next_pane_id=$(tmux display-message -p "#{pane_id}")
next_pane_id=${next_pane_id:1}


if [[ $current_pane_id -eq $next_pane_id ]]; then
  tmux split-window -v
elif [[ $next_pane_id -lt $current_pane_id ]]; then
  tmux select-pane -U
  if [ $(tmux split-window -v) ]; then
    tmux display-message -p "not enough space"
  else
    true
  fi
else
  true
fi
