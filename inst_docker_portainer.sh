#!/bin/bash

# Permit root login
clear
echo ""
echo "01/11 - Give Root login access"
echo ""
sleep 2
sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/g' /etc/ssh/sshd_config
echo ""
echo "01/11 - Give Root login access - successful"
echo ""
sleep 5

# update system
clear
echo ""
echo "02/11 - Run apt update"
echo ""
sleep 2
sudo apt update -y
echo ""
echo "02/11 - Run apt update - successful"
echo ""
sleep 5

# upgrade system
clear
echo ""
echo "03/11 - Run apt upgrade"
echo ""
sleep 2
sudo apt upgrade -y
echo ""
echo "03/11 - Run apt upgrade - successful"
echo ""
sleep 5

# install docker
clear
echo ""
echo "04/11 - Install curl"
echo ""
sleep 2
sudo apt install curl -y
echo ""
echo "04/11 - Install curl - successful"
echo ""
sleep 5

clear
echo ""
echo "05/11 - Get docker script"
echo ""
sleep 2
curl -fsSL https://get.docker.com -o get-docker.sh
echo ""
echo "05/11 - Get docker script - successful"
echo ""
sleep 5

clear
echo ""
echo "06/11 - Run docker script"
echo ""
sleep 2
sudo sh get-docker.sh
echo ""
echo "06/11 - Run docker script - successful"
echo ""
sleep 5

# Install docker.compose
# Make some update to get the latest version
clear
echo ""
echo "07/11 - Get docker-compose version 1.24.7"
echo ""
sleep 2
sudo curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
echo ""
echo "07/11 - Get docker-compose - successful"
echo ""
sleep 5

clear
echo ""
echo "08/11 - Give docker-compose +x rights"
echo ""
sleep 2
sudo chmod +x /usr/local/bin/docker-compose
echo ""
echo "08/11 - Give docker-compose +x rights - successful"
echo ""
sleep 5

clear
echo ""
echo "09/11 - Verify docker-compose version"
echo ""
sleep 2
docker-compose --version
echo ""
echo "09/11 - Verify docker-compose version - successful"
echo ""
sleep 5

# Install portainer
clear
echo ""
echo "10/11 - Create Portainer Volume"
echo ""
sleep 2
docker volume create portainer_data
echo ""
echo "10/11 - Create Portainer Volume - successful"
sleep 5

clear
echo ""
echo "11/11 - Install Portainer"
echo ""
sleep 2
docker run -d -p 8000:8000 -p 9000:9000 --name=portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce
echo ""
echo "11/11 - Install Portainer - successful"
echo ""
sleep 5
echo ""
echo "Script successfully executed"
echo ""
IP=`hostname -I | cut -d' ' -f2`
echo "You can now access Portainer on " $IP":9000"
echo ""
