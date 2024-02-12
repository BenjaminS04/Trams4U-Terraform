#!/bin/bash
sudo -i

apt update
apt upgrade -y

sed -i 's/#$nrconf{restart} = '"'"'i'"'"';/$nrconf{restart} = '"'"'a'"'"';/g' /etc/needrestart/needrestart.conf
sed -i "s/#\$nrconf{kernelhints} = -1;/\$nrconf{kernelhints} = -1;/g" /etc/needrestart/needrestart.conf

apt install nodejs -y
apt install npm -y

apt-get install -y git

REPO_URL="your-repo-url"
APP_DIRECTORY="your-app-directory"

npm install
npm start