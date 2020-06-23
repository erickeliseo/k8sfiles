#!/bin/bash
cd ~/
mkdir -p /mnt/quay/config
mkdir -p /mnt/quay/storage
cp ~/k8sfiles/quay/quay-config.tar.gz /mnt/quay/config/
cp ~/k8sfiles/quay/certs/server.crt /etc/pki/ca-trust/source/anchors/
cp ~/k8sfiles/quay/certs/rootCA.crt /etc/pki/ca-trust/source/anchors/
cd /mnt/quay/config/
tar xvf quay-config.tar.gz
sleep 3
chmod -R 777 /mnt/quay/storage/
update-ca-trust
systemctl restart docker ; systemctl status docker
