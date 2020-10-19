#!/bin/bash

# Permit root login
clear
echo ""
echo "Give Root login access"
echo ""
sleep 2
sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/g' /etc/ssh/sshd_config
echo ""
echo "Give Root login access - successful"
sleep 5

# update and upgrade system
clear
echo ""
echo "Run apt update"
echo ""
sleep 2
sudo apt update -y
echo ""
echo "Run apt update - successful"
sleep 5

clear
echo ""
echo "Run apt upgrade"
echo ""
sleep 2
sudo apt upgrade -y
echo ""
echo "Run apt upgrade - successful"
sleep 5

# install docker
clear
echo ""
echo "Install curl"
echo ""
sleep 2
sudo apt install curl -y
echo ""
echo "Install curl - successful"
sleep 5

clear
echo ""
echo "Get docker script"
echo ""
sleep 2
curl -fsSL https://get.docker.com -o get-docker.sh
echo ""
echo "Get docker script - successful"
sleep 5

clear
echo ""
echo "Run docker script"
echo ""
sleep 2
sudo sh get-docker.sh
echo ""
echo "Run docker script - successful"
sleep 5

# Install docker.compose
# Make some update to get the latest version
clear
echo ""
echo "Get docker-compose version 1.24.7"
echo ""
sleep 2
sudo curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
echo ""
echo "Get docker-compose - successful"
sleep 5

clear
echo ""
echo "Give docker-compose +x rights"
echo ""
sleep 2
sudo chmod +x /usr/local/bin/docker-compose
echo ""
echo "Give docker-compose +x rights - successful"
sleep 5

clear
echo ""
echo "Verify docker-compose version"
echo ""
sleep 2
docker-compose --version
echo ""
echo "Verify docker-compose version - successful"
sleep 5

# Install portainer
clear
echo ""
echo "Create Portainer Volume"
echo ""
sleep 2
docker volume create portainer_data
echo ""
echo "Create Portainer Volume - successful"
sleep 5

clear
echo ""
echo "Install Portainer"
echo ""
sleep 2
docker run -d -p 8000:8000 -p 9000:9000 --name=portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce
echo ""
echo "Install Portainer - successful"
sleep 5
echo ""
echo "Script successfully executed"
