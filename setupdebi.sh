#!/bin/bash
echo "This script will prepare your Debian install run as a server and install the common tools"
apt-get update && apt-get upgrade -y && apt-get dist-upgrade -y && apt-get install wget git curl open-vm-tools vim-* net-tools sudo screen toilet figlet boxes cowsay fortune ruby unzip -y && apt-get autoremove -y

DIR="/opt/fun/lolcat-master/"
if [ -d "$DIR" ]; then
  ### Take action if $DIR exists ###
  echo "The fun tools are allready installed in ${DIR}..."
else
  ###  Control will jump here if $DIR does NOT exists ###
  echo "Installing fun tools in ${DIR}"
  mkdir -p /opt/fun/
  cd /opt/fun/
  wget https://github.com/busyloop/lolcat/archive/master.zip
  unzip master.zip
  cd lolcat-master/bin
  gem install lolcat
fi
toilet -f ivrit 'System Installed' | boxes -d cat -a hc -p h8 | lolcat