ln -s ~/.dotfiles/code/keybindings.json ~/.config/Code/User/keybindings.json
ln -s ~/.dotfiles/code/settings.json ~/.config/Code/User/settings.json

code --list-extensions | xargs -L 1 echo code --install-extension
