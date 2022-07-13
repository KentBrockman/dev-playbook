#!/bin/bash

# inspired by https://arslan.io/2021/02/15/automatic-dark-mode-for-terminal-applications/

function send_keys() {
	# grab all windows for all sessions
	for wix in $(tmux list-windows -a -F \#S:\#I); do
		# grab all ttys for panes
		for pane in $(tmux list-panes -t $wix -F '#P|#{pane_tty}'); do
			# split $pane into the pane index and tty
			readarray -d '|' -t splits <<< "$pane";
			pix="${splits[0]}";
			ptty="${splits[1]}";

			# grab latest process per tty
			lastproc=$(ps --tty $ptty -o comm | tail -n1)

			if [[ $lastproc == 'nvim' ]]; then
				# echo $wix.$pix $lastproc;
				# start with an escape, end with an enter
				# Ctrl-V <your key> to record a literal keypress
				tmux send-keys -t $wix.$pix ':call ChangeBackground()'
			fi
		done
	done
}

# send keys initially
send_keys

# watch for changes in system theme via dconf
# send keys to every nvim instance once a change has been detected
dconf watch /org/gnome/desktop/interface/gtk-theme | grep --line-buffered gtk-theme | while IFS='' read -r line; do send_keys; done
