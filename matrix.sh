#!/bin/bash

# This script is used to switch theme of dwm, dmenu, dunst, alacritty, zshrc, and nvim
DWM_PATH="$HOME/.local/src/DvaporWaveM"
DMENU_PATH="$HOME/.local/src/dmenu"
DUNST_CONFIG_PATH="$HOME/.config/dunst/dunstrc"
ALACRITTY_CONFIG_PATH="$HOME/.config/alacritty/alacritty"
ZSHRC_PATH="$HOME/.config/zsh/.zshrc"
NVIM_THEME_PATH="$HOME/.config/nvim/colors/tragdate.vim"

sudo -v
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &


enter_matrix(){
	notify-send "Matrix" "Enter Matrix Mode" 

	cd $DWM_PATH && cp config.matrix.h config.h && sudo make install >/dev/null 2>/dev/null
	cd $DMENU_PATH && cp config.matrix.h config.h && sudo make install >/dev/null 2>/dev/null &
	cp $DUNST_CONFIG_PATH.matrix $DUNST_CONFIG_PATH &
	cp $ALACRITTY_CONFIG_PATH.matrix.toml $ALACRITTY_CONFIG_PATH.toml &
	#sed -i 's/colorscheme.*/colorscheme tragdate/' "${NVIM_THEME_PATH}" &
	cp $ZSHRC_PATH.matrix $ZSHRC_PATH &

	feh --bg-scale $HOME/Pictures/tdmatrix.jpg
	sudo pkill -HUP dwm
	sudo pkill -HUP dunst

	notify-send "Matrix" "Wake Up Neo" 

	pkill -P $$
}

exit_matrix(){

	notify-send "Matrix" "Finding the Exit..."

	cd $DWM_PATH && cp config.vapor.h config.h && sudo make install >/dev/null 2>/dev/null
	cd $DMENU_PATH && cp config.vapor.h config.h && sudo make install >/dev/null 2>/dev/null &
	cp $DUNST_CONFIG_PATH.vapor $DUNST_CONFIG_PATH &
	cp $ALACRITTY_CONFIG_PATH.vapor.toml $ALACRITTY_CONFIG_PATH.toml &
	#sed -i 's/colorscheme.*/colorscheme vapor/' "${NVIM_THEME_PATH}" &
	cp $ZSHRC_PATH.vapor $ZSHRC_PATH &
	feh --bg-scale $HOME/Pictures/tdvapor.jpg
	sudo pkill -HUP dwm
	sudo pkill -HUP dunst

	notify-send "Matrix" "Welcome Back to Reality"

}

if [ "$1" == "enter" ]; then
	enter_matrix
elif [ "$1" == "exit" ]; then
	exit_matrix
else
	echo "Usage: matrix.sh [enter|exit]"
fi
