#!/bin/bash

#Making some required directories
echo 'MAKING DIRECTORIES'
mkdir ~/github
mkdir ~/.fonts
mkdir ~/.config/bspwm
mkdir ~/.config/sxhkd
mkdir ~/.config/polybar
cd ~/github
touch ~/.xinitrc

echo 'INSTALLING APPLICATIONS'
#Installs required applications
sudo pacman -S xorg -y
sudo pacman -S xorg-server -y
sudo pacman -S xorg-xinit -y
sudo pacman -S polybar -y
sudo pacman -S bspwm -y
sudo pacman -S sxhkd -y
sudo pacman -S gimp -y
sudo pacman -S discord -y
sudo pacman -S networkmanager networkmanager-openrc -y

echo 'NOW CLONING MY DOTFILE REPOS'

#Cloning repos
git clone https://aur.archlinux.org/yay.git
git clone https://gitlab.com/ixp123/dotfiles/-/tree/master/.config/bspwm
git clone https://gitlab.com/ixp123/dotfiles/-/tree/master/.config/sxhkd
git clone https://github.com/ixp123/myfonts
git clone https://github.com/ixp123/bashrc
git clone https://git.suckless.org/dmenu

echo 'NOW COPYING AND COMPILING APPLICATION FILES'

#Copy and compile
cd ~/github/bspwm
cp bspwmrc ~/.config/bspwm
cd ~/.config/bspwm 
sudo chmod +x bspwmrc

cd ~/github/sxhkd
cp sxhkdrc ~/.config/sxhkd
cd ~/.config/sxhkd
sudo chmod +x sxhkdrc

cd ~/github/yay
makepkg -si

cd ~/github/myfonts
cp 'Font Awesome 5 Brands-Regular-400.otf' ~/.fonts
cp 'Font Awesome 5 Free-Regular-400.otf' ~/.fonts
cp 'Font Awesome 5 Free-Solid-900.otf' ~/.fonts

cd ~/github/bashrc/
cp bashrc ~/.bashrc

cd ~/github/dmenu
sudo make clean install

cd

echo 'UPDATING SYSTEM'

#Updates the system 
sudo pacman -Syyu

#Finish
echo quickset is done, reboot, login, and then enter 'startx'
#done




















