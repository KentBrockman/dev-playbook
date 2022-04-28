#!/usr/bin/zsh

# initialize pyenv if installed
# BUG: if in zshenv (which might be nice so pyenv is on all shells) vim buffers become super slow
# unsure how to troubleshoot this at this time
if [ -d "$HOME/.pyenv/bin" ]; then
	pathmunge "$HOME/.pyenv/bin"
fi
if [ $(command -v pyenv) ]; then
	# BUG: this will create a duplicate path entry for ~/.pyenv/shims
	# this is because pyenv init - doesn't set PATH using pathmunge
  # TODO: scrub path after pyenv init
	eval "$(pyenv init -)"
	eval "$(pyenv virtualenv-init -)"
fi
