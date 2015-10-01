#!/bin/bash

apt-get update
apt-get install -y git build-essential cmake python-dev
mkdir -p /home/vagrant/.vim/autoload /home/vagrant/.vim/bundle
git clone https://github.com/VundleVim/Vundle.vim.git /home/vagrant/.vim/bundle/Vundle.vim
git clone https://github.com/fatih/vim-go.git /home/vagrant/.vim/bundle/vim-go
ln -sF /vagrant/vimrc.local /home/vagrant/.vimrc
chown vagrant:vagrant /home/vagrant/.vimrc
chown -R vagrant:vagrant /home/vagrant/.vim

# manual steps after 'vagrant up'
#vim +PluginInstall +qall
#/home/vagrant/.vim/bundle/YouCompleteMe/install.py --clang-completer
