#!/bin/bash

# -- the commands taken from https://github.com/Valloric/YouCompleteMe/wiki/Building-Vim-from-source

apt-get install -y libncurses5-dev libgnome2-dev libgnomeui-dev \
    libgtk2.0-dev libatk1.0-dev libbonoboui2-dev libcairo2-dev libx11-dev \
    libxpm-dev libxt-dev python-dev ruby-dev git
apt-get install -y checkinstall

apt-get remove -y vim vim-runtime gvim vim-tiny vim-common vim-gui-common

dpkg -r myvim

rm -rf /tmp/vim-build
mkdir -p /tmp/vim-build
cd /tmp/vim-build

git clone https://github.com/vim/vim.git .

./configure --with-features=huge \
            --enable-multibyte \
            --enable-rubyinterp=yes \
            --enable-pythoninterp=yes \
            --with-python-config-dir=/usr/lib/python2.7/config \
            --enable-perlinterp=yes \
            --enable-luainterp=yes \
            --enable-python3interp=yes \
            --with-python3-config-dir=/usr/lib/python3.5/config \
            --enable-gui=gtk2 --enable-cscope --prefix=/usr

make VIMRUNTIMEDIR=/usr/share/vim/vim80
checkinstall -y --pkgname=myvim --pkgversion=80 --provides=myvim

update-alternatives --install /usr/bin/editor editor /usr/bin/vim 1
update-alternatives --set editor /usr/bin/vim
update-alternatives --install /usr/bin/vi vi /usr/bin/vim 1
update-alternatives --set vi /usr/bin/vim

