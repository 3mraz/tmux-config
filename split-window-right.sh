#!/bin/bash


current_pane_id=$(tmux display-message -p "#{pane_id}")
current_pane_id=${current_pane_id:1}
tmux select-pane -R 
next_pane_id=$(tmux display-message -p "#{pane_id}")
next_pane_id=${next_pane_id:1}


if [[ $current_pane_id -eq $next_pane_id ]]; then
  tmux split-window -h -c "#{pane_current_path}"
elif [[ $next_pane_id -lt $current_pane_id ]]; then
  tmux select-pane -L
  if [ $(tmux split-window -h -c "#{pane_current_path}") ]; then
    tmux display-message -p "not enough space"
  else
    true
  fi
else
  true
fi
