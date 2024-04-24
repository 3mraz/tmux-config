#!/bin/bash

tmux_window_panes=$(tmux list-panes | wc -l)

if [[ $tmux_window_panes -gt 1 ]]; then
  # More than one pane, directly kill
  tmux kill-pane
else
  tmux confirm-before -p "Close Pane? (y/N) " kill-pane || true
fi

