#!/bin/bash

#Making some required directories
mkdir github
mkdir .fonts
cd github

#Installs required applications
sudo pacman -S doas
sudo pacman -S xorg
sudo pacman -S xorg-server
sudo pacman -S xinit
sudo pacman -S gimp
sudo pacman -S discord
sudo pacman -S emacs

#Cloning repos
git clone https://github.com/ixp123/dwmconf
git clone https://github.com/ixp123/stconf
git clone https://github.com/ixp123/dwmblocks
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

cd ~/github/dwmblocks
rm blocks.h
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

#Configures doas
echo "permit $USER as root" /usr/local/etc/doas.conf

#Updates the system 
sudo pacman -Syyu

#Finish
echo auto-setup is done, reboot, and when prompted at login screen, press ALT+CTRL+F2, and then enter 'startx'
#done




















