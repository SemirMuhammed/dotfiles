#!/bin/bash

# Initial Setup file for new systems
echo --------- Neovim Configuration Setup ---------
gitpath=$(pwd)
rm -rf ~/.config/nvim
rm -rf ~/.local/share/nvim
rm -rf ~/.cache/nvim
ln -s "$gitpath" "$HOME/.config/nvim"
echo ---------- Completed Successfully!!! ---------

