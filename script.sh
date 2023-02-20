#!/bin/bash

# sleep until instance is ready
# until [[ -f /var/lib/cloud/instance/boot-finished ]]; do
#   sleep 1
# done

sudo apt-get update
sudo apt install docker.io -y
#sudo service docker start
sudo apt install wget curl -y
sudo groupadd docker
sudo usermod -aG docker ubuntu
sudo curl -L "https://github.com/docker/compose/releases/download/1.25.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo git clone https://github.com/meriem-mounchid/app-test-01.git app
sudo docker-compose -f /app/docker-compose.yaml up --build -d
sleep 3
# find / -type d -name "app" 2>/dev/null
# terraform output instance_ip > output.txt
# --url="http://3.252.138.138"
# $IP_WP

#sudo chmod 777 .env
#sudo echo "IP_WP="${Public_IP} >> .env
#sudo echo $Hello >> .env