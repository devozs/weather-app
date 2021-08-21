#!/bin/bash
find ./ -type f -iname "*.sh" -exec chmod +x {} \;

echo "Installing Docker"
# install docker using convenience script
sudo curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo groupadd docker
sudo usermod -aG docker ${USER}

echo "Installing Maven"
# install Maven
sudo apt -y install maven