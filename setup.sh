#!/bin/bash

# Symlink Config Files
ln -sfnT ~/dotfiles/nvim ~/.config/nvim
ln -sfnT ~/dotfiles/i3 ~/.config/i3
ln -sfnT ~/dotfiles/bashrc ~/.bashrc
ln -sfnT ~/dotfiles/zshrc ~/.zshrc
ln -sfnT ~/dotfiles/kitty ~/.config/kitty

rm -rf ~/.local/share/fonts
ln -sT ~/dotfiles/fonts ~/.local/share/fonts

