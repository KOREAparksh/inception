#!/bin/sh

curl -fsSL get.docker.com -o get-docker.sh

sh get-docker.sh && \
	sudo chmod 666 /var/run/docker.sock && \
	sudo chmod +x /usr/local/bin/docker-compose && \
	sudo su -c 'printf "{\n\t\"live-restore\": true\n}" > /etc/docker/docker.json' && \
	sudo systemctl restart docker
