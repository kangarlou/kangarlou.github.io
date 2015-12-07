#!/bin/bash

apt-get update
apt-get install -y git build-essential cmake python-dev golang
mkdir -p /home/vagrant/.vim/autoload /home/vagrant/.vim/bundle
mkdir -p /home/vagrant/go
echo -n >  /etc/profile.d/gopath.sh
echo 'export GOPATH=$HOME/go' >> /etc/profile.d/gopath.sh
echo 'export PATH=$PATH:$GOPATH/bin' >> /etc/profile.d/gopath.sh
git clone https://github.com/VundleVim/Vundle.vim.git /home/vagrant/.vim/bundle/Vundle.vim
git clone https://github.com/fatih/vim-go.git /home/vagrant/.vim/bundle/vim-go
ln -sF /vagrant/vimrc.local /home/vagrant/.vimrc
chown -R vagrant:vagrant /home/vagrant

# manual steps after 'vagrant up'
#vim +PluginInstall +qall
#$HOME/.vim/bundle/YouCompleteMe/install.py --clang-completer
#vim +GoInstallBinaries +qall 
