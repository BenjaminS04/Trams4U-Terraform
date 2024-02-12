#!/bin/bash
sudo -i
apt update
apt upgrade -y

sed -i 's/#$nrconf{restart} = '"'"'i'"'"';/$nrconf{restart} = '"'"'a'"'"';/g' /etc/needrestart/needrestart.conf
sed -i "s/#\$nrconf{kernelhints} = -1;/\$nrconf{kernelhints} = -1;/g" /etc/needrestart/needrestart.conf

apt install nodejs -y
apt install npm -y

mkdir ec2
cd ec2
git clone https://github.com/icybox129/ec2-metadata-app.git
cd ec2-metadata-app
npm i
node app.js