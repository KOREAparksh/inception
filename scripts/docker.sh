#!/bin/zsh

sudo curl -sSL https://get.docker.com/ | sh && \
sudo curl -L https://github.com/docker/compose/releases/download/v2.10.2/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose && \
sudo systemctl restart docker && \
sudo su -c 'printf "{\n\t\"live-restore\": true\n}" > /etc/docker/docker.json' && \
sudo chmod 666 /var/run/docker.sock && \
sudo chmod +x /usr/local/bin/docker-compose

echo "alias del-container=\"docker rm -f \`docker images -qa\`\"" >> ~/.zshrc
echo "alias del-image=\"docker rmi -f \`docker images -qa\`\"" >> ~/.zshrc

source ~/.zshrc

