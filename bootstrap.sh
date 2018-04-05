#!/bin/bash

if [[ $EUID -ne 0 ]]; then
   exec sudo $0
fi

apt-get install -y apt-transport-https ca-certificates curl software-properties-common

curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"

apt-get update
apt-get install -y docker-ce

systemctl enable docker.service
systemctl start docker.service
