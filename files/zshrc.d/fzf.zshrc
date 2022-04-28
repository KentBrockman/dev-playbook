#!/usr/bin/zsh

if [ $(command -v fzf) ]; then
	# use ripgrep to find files before passing them to fzf (default is find, which doesnt respect .gitignore)
	export FZF_DEFAULT_COMMAND='rg --files --follow --hidden'

	# Append this line to ~/.zshrc to enable fzf keybindings for Zsh:
	# To see this in action:
	# type <CTRL-R> for reverse search
	# type <CTRL-T> for file search
	# type <ALT-C> for cd
	source /usr/share/doc/fzf/examples/key-bindings.zsh

	# Append this line to ~/.zshrc to enable fuzzy auto-completion for Zsh:
	# To see in action, type any of the following:
	# less **<TAB>
	# unset **<TAB>
	# export **<TAB>
	# unalias **<TAB>
	# cd **<TAB> or cd ../**<TAB>
	source /usr/share/doc/fzf/examples/completion.zsh
fi
