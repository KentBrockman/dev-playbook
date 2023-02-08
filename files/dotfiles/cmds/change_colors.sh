#!/bin/bash

CURRENT_SELECTION=$(gsettings get org.gnome.gedit.preferences.editor scheme)

if [ $CURRENT_SELECTION == "'pop-light'" ]; then
  COLORSCHEME="prefer-dark"
  GTKTHEME="Pop-dark"
  SCHEME="pop-dark"
else
  COLORSCHEME="prefer-light"
  GTKTHEME="Pop"
  SCHEME="pop-light"
fi

# update color-scheme first
# update_nvim_colors.sh watches org.gnome.desktop.interface.gtk-theme
# nvimrc inspects org.gnome.desktop.interface.color-scheme to set the background
gsettings set org.gnome.desktop.interface color-scheme $COLORSCHEME
gsettings set org.gnome.desktop.interface gtk-theme $GTKTHEME
# update org.gnome.gedit.preferences.editor scheme to ensure the gnome menu has the right item selected
gsettings set org.gnome.gedit.preferences.editor scheme $SCHEME

# update nvim terminal colors
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
				# final : is to clear the message
				tmux send-keys -t $wix.$pix ':call ChangeBackground():'
			fi
		done
	done
}

# send keys initially
send_keys

# watch for changes in system theme via dconf
# send keys to every nvim instance once a change has been detected
# dconf watch /org/gnome/desktop/interface/gtk-theme | grep --line-buffered gtk-theme | while IFS='' read -r line; do send_keys; done
