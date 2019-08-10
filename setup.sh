#!/bin/sh

# Copies the files to the location from which they're run by default
#
# author: stevenmaio

HOME_LOCATION=~/.smaio-configs
SNIPPETS_DIR=mysnippets

cp main.vim ~/.vimrc
cp tmux.conf ~/.tmux.conf
cp zathurarc ~/.config/zathura/zathurarc

rm -rf $HOME_LOCATION
mkdir $HOME_LOCATION $HOME_LOCATION/$SNIPPETS_DIR
cp $SNIPPETS_DIR/* $HOME_LOCATION/$SNIPPETS_DIR
