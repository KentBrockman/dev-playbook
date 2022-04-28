#!/usr/bin/zsh

# initialize node if installed
if [ -d "$HOME/.node/bin" ]; then
  pathmunge "$HOME/.node/bin"
fi
