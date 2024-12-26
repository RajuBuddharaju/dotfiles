#!/bin/bash

# Symlink Config Files
ln -sfn ~/dotfiles/nvim ~/.config/nvim
ln -sfn ~/dotfiles/i3 ~/.config/i3
ln -sfn ~/dotfiles/bashrc ~/.bashrc
ln -sfn ~/dotfiles/zshrc ~/.zshrc
ln -sfn ~/dotfiles/kitty ~/.config/kitty

rm -rf ~/.local/share/fonts
ln -s ~/dotfiles/fonts ~/.local/share/fonts

