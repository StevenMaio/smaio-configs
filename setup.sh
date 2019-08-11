#!/bin/sh

# Copies the files to the location from which they're run by default
#
# author: stevenmaio

# Delete previous configurations
rm -rf ~/.smaio-configs/

# Copy configs that go in $HOME
cp main.vim ~/.vimrc
cp tmux.conf ~/.tmux.conf

# Copy zathura configs
mkdir -p ~/.config/zathura
cp zathurarc ~/.config/zathura/zathurarc

# Copy my snippets
mkdir -p ~/.smaio-configs/mysnippets
cp mysnippets/* ~/.smaio-configs/mysnippets
