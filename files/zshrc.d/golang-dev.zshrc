#!/usr/bin/zsh

# initialize go if installed
if [ -d "$HOME/go/bin" ]; then
  pathmunge "$HOME/go/bin"
fi
