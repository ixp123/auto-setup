#!/bin/bash

#Making some required directories
mkdir ~/github
mkdir ~/discord
mkdir ~/.fonts
cd ~/github

#Installs required applications
sudo apt install doas
sudo apt install gimp
sudo apt install emacs
sudo apt install build-essential make bison flex libpam0g-dev

#Cloning repos
git clone https://github.com/ixp123/dwmconf
git clone https://github.com/ixp123/stconf
git clone https://github.com/ixp123/slstatusconf
git clone https://github.com/ixp123/myfonts
git clone https://github.com/ixp123/bashrc
git clone https://git.suckless.org/dmenu
git clone https://github.com/hlissner/doom-emacs ~/.emacs.d
git clone https://github.com/slicer69/doas.git

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

cd ~/github/doas
sudo make
sudo make install
touch /usr/local/etc/doas.conf
echo "permit $USER as root" /usr/local/etc/doas.conf

#Install discord
cd ~/discord
wget -O discord.deb "https://discordapp.com/api/download?platform=linux&format=deb"
sudo dpkg -i ~/discord/discord.deb

#Updates the system 
sudo apt update && sudo apt upgrade

#Finish
echo Autorice script is done, reboot, and when prompted at login screen, press ALT+CTRL+F2, and then enter 'startx'
#done




















