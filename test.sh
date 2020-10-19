#!/bin/bash

echo ""
IP=hostname -I | cut -d' ' -f2
echo $IP
echo ""
echo "Access Portainer on xxx.xxx.xxx.xxx:9000"
echo ""
