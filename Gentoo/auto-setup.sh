#!/bin/bash

#Making some required directories
mkdir github
mkdir .fonts
cd github

#Installs required applications
sudo emerge -a doas
sudo emerge -a xorg
sudo emerge -a xorg-server
sudo emerge -a xinit
sudo emerge -a gimp
sudo emerge -a discord
sudo emerge -a emacs
sudo emerge -a xfce

#Cloning repos
git clone https://github.com/ixp123/dwmconf
git clone https://github.com/ixp123/stconf
git clone https://github.com/ixp123/slstatusconf
git clone https://github.com/ixp123/myfonts
git clone https://github.com/ixp123/bashrc
git clone https://git.suckless.org/dmenu
git clone https://github.com/hlissner/doom-emacs ~/.emacs.d


#Compile applications
cd dwmconf
cp xinitrc ~/.xinitrc

cd dwm
sudo make clean install

cd ~/github/stconf/st-0.8.4
sudo make clean install

cd ~/github/slstatusconf/slstatus
sudo make clean install

cd ~/github/myfonts
cp 'Font Awesome 5 Brands-Regular-400.otf' ~/.fonts
cp 'Font Awesome 5 Free-Regular-400.otf' ~/.fonts
cp 'Font Awesome 5 Free-Solid-900.otf' ~/.fonts

cd ~/github/bashrc/
cp bashrc ~/.bashrc

cd ~/github/dmenu
sudo make clean install

~/.emacs.d/bin/doom install

#Setup doas config
echo 'permit $USER as root' /usr/local/etc/doas.conf

#Updates the system 
doas emerge -auDN @world

#Finish
echo auto-setup is done, reboot, and when prompted at login screen, press ALT+CTRL+F2, and then enter 'startx'
#done




















