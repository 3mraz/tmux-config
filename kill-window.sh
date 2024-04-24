#!/bin/bash

tmux_session_windows=$(tmux list-windows | wc -l)

if [[ $tmux_session_windows -gt 1 ]]; then
  # More than one window, directly kill
  tmux kill-window
else
  tmux confirm-before -p "Close Window? (y/N) " kill-window || true
fi

