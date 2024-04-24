#!/bin/bash

# Check if there are any windows
if [ $(tmux list-windows | wc -l) -gt $(tmux display-message -p '#I') ]; then
    # If no windows exist, create a new window and switch to it
    tmux next-window
else
    # If windows exist, switch to the next window
    tmux new-window
fi

