#! /bin/bash

sudo apt-get -y update
sudo apt-get -y install mc git jq
sudo apt-get -y install nginx
sudo apt-get -y install certbot
sudo apt-get -y install s3cmd

# Install Docker
sudo apt-get -y install apt-transport-https ca-certificates curl software-properties-common
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
sudo apt-get -y update
sudo apt-cache policy docker-ce
sudo apt-get -y install docker-ce
export DOCKER_STATUS=$(systemctl status docker)

# Install Docker Compose
sudo curl -L https://github.com/docker/compose/releases/download/1.27.4/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
export DOCKER_COMPOSE_VERSION=$(docker-compose --version)
