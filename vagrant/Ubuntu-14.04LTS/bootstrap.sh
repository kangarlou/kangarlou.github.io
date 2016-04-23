#!/bin/bash

# setting up golang dev environment
apt-get update
apt-get install -y git build-essential cmake python-dev golang
mkdir -p /home/vagrant/.vim/autoload /home/vagrant/.vim/bundle
mkdir -p /home/vagrant/go
echo -n >  /etc/profile.d/gopath.sh
echo 'export GOPATH=$HOME/go' >> /etc/profile.d/gopath.sh
echo 'export PATH=$PATH:$GOPATH/bin' >> /etc/profile.d/gopath.sh
git clone https://github.com/VundleVim/Vundle.vim.git /home/vagrant/.vim/bundle/Vundle.vim
git clone https://github.com/fatih/vim-go.git /home/vagrant/.vim/bundle/vim-go
git clone https://github.com/Valloric/YouCompleteMe.git /home/vagrant/.vim/bundle/YouCompleteMe
ln -sF /vagrant/vimrc.local /home/vagrant/.vimrc
chown -R vagrant:vagrant /home/vagrant

# setting up docker
apt-get install apt-transport-https ca-certificates
apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
echo "deb https://apt.dockerproject.org/repo ubuntu-trusty main" > /etc/apt/sources.list.d/docker.list
apt-get update
apt-get purge -y lxc-docker
apt-get install -y linux-image-extra-$(uname -r) apparmor docker-engine
usermod -aG docker vagrant

# manual steps after 'vagrant up'
#(cd $HOME/.vim/bundle/YouCompleteMe && exec git submodule update --init --recursive)
#$HOME/.vim/bundle/YouCompleteMe/install.py --clang-completer
#vim +PluginInstall +qall
#vim +GoInstallBinaries +qall 
