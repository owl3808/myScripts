#!/bin/bash
#config here
myName=""
myEmail=""


sudo apt-get install -y vim git filezilla

# regular upgrade
sudo crontab -l > mycron
echo "1 0 * * * sudo /bin/sh -c \"/usr/bin/apt-get update && /usr/bin/apt-get upgrade -y\">> /tmp/upgrade.log 2>&1" >> mycron
sudo crontab mycron
rm mycron


# setup git
git config --global user.name $myName
git config --global user.email $myEmail
git config --global core.editor vim
