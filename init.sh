#!/usr/bin/env bash

set -e

# link the confs
ln tmux.conf ~/.tmux.conf
ln vimrc ~/.vimrc

# install tpm
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# intall vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
