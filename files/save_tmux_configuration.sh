#!/bin/bash

tmux server-info &> /dev/null;
if [[ $? == 0 ]]; then 
    ~/.tmux/plugins/tmux-resurrect/scripts/save.sh quiet;
else 
    echo "tmux server not running. dont save session";
fi
