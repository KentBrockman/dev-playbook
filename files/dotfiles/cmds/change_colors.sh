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

exit 0;
