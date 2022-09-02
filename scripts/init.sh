#!/bin/sh

# 1. sudo apt-get install -y git
# 2. git clone https://github.com/nfl1ryxditimo12/inception

sudo sed -i "s/http:\/\/security.ubuntu.com/https:\/\/mirror.kakao.com" /etc/apt/sources.list
sudo sed -i "s/http:\/\/kr.archive.ubuntu.com/https:\/\/mirror.kakao.com" /etc/apt/sources.list

sudo apt-get update

## SSH Setting

sudo apt-get install \
	inet-tools \
	openssh-server \

sudo sed -i "s/#Port 22/Port 22" /etc/ssh/sshd_config
sudo systemctl restart ssh
sudo ufw enable
sudo ufw allow 22

sudo apt-get install -y \
	apt-transport-https \
	make \
	vim \
	systemd \
