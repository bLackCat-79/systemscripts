#!/bin/bash
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
toilet -w 180 -f ivrit 'Installing Foreman' | boxes -d cat -a hc -p h8 | lolcat

apt-get update && apt-get upgrade -y && apt-get install ca-certificates wget gpg -y
mkdir -p /opt/foreman-setup
cd /opt/foreman-setup
wget https://apt.puppet.com/puppet6-release-buster.deb
apt-get install ./puppet6-release-buster.deb -y
echo "deb http://deb.theforeman.org/ buster 2.4" | sudo tee /etc/apt/sources.list.d/foreman.list
echo "deb http://deb.theforeman.org/ plugins 2.4" | sudo tee -a /etc/apt/sources.list.d/foreman.list
wget -q https://deb.theforeman.org/pubkey.gpg -O- | sudo apt-key add -
apt-get update && apt-get upgrade -y
apt-get install foreman-installer -y
foreman-installer --enable-foreman --enable-foreman-proxy --enable-puppet --enable-foreman-plugin-ansible --enable-foreman-plugin-bootdisk --enable-foreman-plugin-chef --enable-foreman-plugin-dhcp-browser --enable-foreman-plugin-discovery --enable-foreman-plugin-monitoring --enable-foreman-plugin-setup --enable-foreman-compute-vmware
apt-get install certbot python-certbot-apache

