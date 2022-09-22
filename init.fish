#!/usr/bin/env fish

# link the confs
ln -sf (pwd)/tmux.conf ~/.tmux.conf
ln -sf (pwd)/vimrc ~/.vimrc
ln -sf (pwd)/config.fish ~/.config/fish/config.fish

if not test -e ~/.tmux/plugins/tpm
    # install tpm
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
end

if not test -e ~/.vim/bundle/Vundle.vim
    # intall vundle
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    vim +PluginInstall +qall
end

# build weather.go
go build weather.go

# make sure ~/bin exists and link binaries
mkdir -p ~/bin
ln -sf (pwd)/battery.fish ~/bin/battery.fish
ln -sf (pwd)/weather ~/bin/weather
ln -sf (pwd)/mr.py ~/bin/mr.py
