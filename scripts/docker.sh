#!/bin/sh

sudo curl -sSL https://get.docker.com/ | sh

sudo chmod 666 /var/run/docker.sock

sudo su -c 'printf "{\n\t\"live-restore\": true\n}" > /etc/docker/docker.json'

sudo curl -L https://github.com/docker/compose/releases/download/v2.10.2/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose

sudo chmod +x /usr/local/bin/docker-compose

sudo systemctl restart docker
