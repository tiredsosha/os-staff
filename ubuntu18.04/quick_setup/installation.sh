#!/bin/bash
apt update -y  && sudo apt upgrade -y

# teamviewer
# wget https://download.teamviewer.com/download/linux/teamviewer_amd64.deb
# apt install ./teamviewer_amd64.deb

# ssh install
apt update
apt-get update
apt install openssh-server 

# pritunl client
sudo tee /etc/apt/sources.list.d/pritunl.list << EOF
deb https://repo.pritunl.com/stable/apt bionic main
EOF
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com --recv 0x7568D9BB55FF9E5287D586017AE645C0CF8E292A
sudo apt-get update
sudo apt-get install pritunl-client-electron

# docker
apt-get remove docker docker-engine docker.io containerd runc
apt-get update && apt-get install -y apt-transport-https ca-certificates curl gnupg-agent software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
$(lsb_release -cs) \
stable"
apt-get update && apt-get install -y docker-ce=5:19.03.14~3-0~ubuntu-bionic docker-ce-cli=5:19.03.14~3-0~ubuntu-bionic containerd.io
docker ps -a
usermod -aG docker hc
curl -L "https://github.com/docker/compose/releases/download/1.27.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

# homeassistant
apt-get install -y software-properties-common apparmor-utils apt-transport-https avahi-daemon ca-certificates curl dbus jq network-manager socat
systemctl disable ModemManager
systemctl stop ModemManager
curl -sL https://raw.githubusercontent.com/home-assistant/supervised-installer/master/installer.sh | bash -s
printf '{"ignore_conditions": ["healthy"]}' > /usr/share/hassio/jobs.json
ha core update --version 2021.6.6
