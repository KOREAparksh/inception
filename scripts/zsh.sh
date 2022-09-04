#!/bin/zsh
sudo sed -i "s/plugins=(git)/plugins=(git zsh-autosuggestions)/g" $HOME/.zshrc
source $HOME/.zshrc
