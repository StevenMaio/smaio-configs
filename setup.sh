#!/bin/sh

# Copies the files to the location from which they're run by default. If no
# arguments are given then the configuration files will be copied over. And
# if `copy` is given as an argument then the configuration file will be copied
# as well. If `install` is given the script will try to install the appropriate
# software.
#
# author: smaio

PM=apt-get

# Copies all the configuration itmes to their destinations
copy_configs() {
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

    echo "Copying configurations..."
}

# Installs all of the required software
install_software() {
    echo "Installing software..."
    sudo $PM install git tmux ctags zathura vim
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    vim +PluginInstall +qall
}

print_usage() {
    echo "Usage: setup.sh [command]"
    echo ""
    echo "Commands:"
    echo "    copy        copy the configuration files. This action is taken if no arguments are given"
    echo "    install     install the appropriate software"
}

# Copy if no command is given by default
if [ $# -lt 1 ]; then
    copy_configs
else
    if [ $1 = "copy" ]; then
        copy_configs
    elif [ $1 = "install" ]; then
        copy_configs
        install_software
    else
        print_usage
    fi
fi
