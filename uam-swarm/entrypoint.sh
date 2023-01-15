#!/bin/bash
cd /tmp
apt update && apt -yq install wget libglib2.0-0 ca-certificates dnsmasq wondershaper
update-ca-certificates
wget https://update.u.is/downloads/uam/linux/uam-latest_amd64.deb
dpkg -i uam-latest_amd64.deb
cd /opt/uam/
echo "[net]" >> /root/.uam/uam.ini
container_ip="$(hostname -i)"
echo "listens=[${container_ip}]:$2" >> /root/.uam/uam.ini
if [[ "$5" == "true" ]]; then
  wondershaper eth0 $3 $4 &
fi
./uam --pk $1 --http [0.0.0.0]:17099 --no-ui
