#!/bin/bash
USER=`whoami`
VERSION=`cat /etc/*rele* |grep -i '^name'|cut -d\" -f2`
if [[ $VERSION -eq "Ubuntu" ]];
then
        sudo -S apt install -y zsh
else
        if [[ $VERSION -eq "Arch" ]] || [[ $VERSION -eq "Manjaro" ]];
        then
                sudo -S pacman -S zsh
        fi
fi

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
sed -i 's/robbyrussell/bira/g' .zshrc
sudo -S usermod -s /usr/bin/zsh $USER