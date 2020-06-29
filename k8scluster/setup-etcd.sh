#!/bin/bash
rm -fR /var/lib/etcd && rm -rf /tmp/etcd && mkdir -p /tmp/etcd
tar xzvf /tmp/etcd.tar.gz -C /tmp/etcd --strip-components=1
cp /tmp/etcd/etcd /usr/local/bin/
cp /tmp/etcd/etcdctl /usr/local/bin/
cp ~/k8sfiles/k8scluster/etcd.conf /etc/etcd.conf
cp ~/k8sfiles/k8scluster/etcd3.service /etc/systemd/system/etcd3.service
export SELF_IP=$(ip -4 addr show enp0s8 | grep -oP "(?<=inet ).*(?=/)")
echo $SELF_IP
sed -i "s/SELF_IP=0.0.0.0/SELF_IP=$SELF_IP/g" "/etc/etcd.conf"
sudo systemctl daemon-reload
sudo systemctl enable etcd3
