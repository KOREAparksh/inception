#!/bin/bash

# 1. sudo apt-get install -y git
# 2. git clone https://github.com/nfl1ryxditimo12/inception

function repository() {
	echo "=================================================REPOSITORY START"
  sudo sed -i "s/http:\/\/security.ubuntu.com/https:\/\/mirror.kakao.com/g" /etc/apt/sources.list
  sudo sed -i "s/http:\/\/kr.archive.ubuntu.com/https:\/\/mirror.kakao.com/g" /etc/apt/sources.list
sudo apt-get update  
	echo "=================================================REPOSITORY END"
}

function zsh() {
	echo "=================================================ZSH START"
  sudo apt-get install -y curl zsh

  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
  echo "=================================================ZSH END"
}

function ssh() {
	echo "=================================================SSH START"
  sudo apt-get install -y \
    net-tools \
    openssh-server \

  sudo sed -i "s/#Port 22/Port 22/g" /etc/ssh/sshd_config
  sudo systemctl restart ssh
  sudo ufw enable
  sudo ufw allow 22
  echo "=================================================SSH END"
}

function util() {
	echo "=================================================UTIL START"
  sudo apt-get install -y \
    apt-transport-https \
    make \
    vim \
    systemd 
	echo "=================================================UTIL END"
}

repository && ssh && util && zsh

