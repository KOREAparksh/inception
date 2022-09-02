#!/bin/sh

# 1. sudo apt-get install -y git
# 2. git clone https://github.com/nfl1ryxditimo12/inception

function repository() {
  sudo sed -i "s/http:\/\/security.ubuntu.com/https:\/\/mirror.kakao.com" /etc/apt/sources.list
  sudo sed -i "s/http:\/\/kr.archive.ubuntu.com/https:\/\/mirror.kakao.com" /etc/apt/sources.list
}

function zsh() {
  sudo apt-get install -y curl

  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
  sudo sed -i "s/plugins=(git)/plugins=(git zsh-autosuggestions)"
  source ~/.zshrc
}

function ssh() {
  sudo apt-get install -y \
    inet-tools \
    openssh-server \

  sudo sed -i "s/#Port 22/Port 22" /etc/ssh/sshd_config
  sudo systemctl restart ssh
  sudo ufw enable
  sudo ufw allow 22
}

function util() {
  sudo apt-get install -y \
    apt-transport-https \
    make \
    vim \
    systemd \
}

sudo apt-get update

repository && zsh && ssh && util
