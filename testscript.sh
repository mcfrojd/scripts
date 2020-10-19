#!/bin/bash

# Permit root login
clear
echo ""
echo "Give Root login access"
echo ""
sleep 2
sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/g' /etc/ssh/sshd_config
echo "Give Root login access - successful"
sleep 5

# update and upgrade system
clear
echo ""
echo "Run apt update"
echo ""
sleep 2
sudo apt update -y
echo "Run apt update - successful"
sleep 5

clear
echo ""
echo "Run apt upgrade"
echo ""
sleep 2
sudo apt upgrade -y
echo "Run apt upgrade - successful"
sleep 5

# install docker
clear
echo ""
echo "Install curl"
echo ""
sleep 2
sudo apt install curl -y
echo "Install curl - successful"
sleep 5

clear
echo ""
echo "Get docker script"
echo ""
sleep 2
curl -fsSL https://get.docker.com -o get-docker.sh
echo "Get docker script - successful"
sleep 5

clear
echo ""
echo "Run docker script"
echo ""
sleep 2
sudo sh get-docker.sh
echo "Run docker script - successful"
sleep 5

# Install docker.compose
# Make some update to get the latest version
clear
echo ""
echo "Get docker-compose"
echo ""
sleep 2
sudo curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
echo "Get docker-compose - successful"
sleep 5
#sudo chmod +x /usr/local/bin/docker-compose
#clear
#docker-compose --version

# Install portainer
#docker volume create portainer_data
#docker run -d -p 8000:8000 -p 9000:9000 --name=portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce
