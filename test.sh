#!/bin/bash

echo ""
IP=`hostname -I | cut -d' ' -f2`
echo "Access Portainer on " $IP":9000"
echo ""
