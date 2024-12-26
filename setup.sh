#!/bin/bash

# Symlink Config Files
ln -sfn ~/dotfiles/nvim ~/.config/nvim
ln -sfn ~/dotfiles/i3 ~/.config/i3
ln -sfn ~/dotfiles/bashrc ~/.bashrc
ln -sfn ~/dotfiles/zshrc ~/.zshrc
ln -sfn ~/dotfiles/kitty ~/.config/kitty

# Ensure ~/.local/share/fonts exists
mkdir -p ~/.local/share/fonts

# Symlink CONTENTS of ~/dotfiles/fonts (Not the Folder)
ln -sfn ~/dotfiles/fonts/* ~/.local/share/fonts/
