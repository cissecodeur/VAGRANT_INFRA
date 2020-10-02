#!/bin/bash
## Installation de Jenkins
IP = $(hostname - I | awk '{print $2}')
echo "START - install jenkins"$IP

echo "[1] : Installation utils & ansible"
apt-get update -qq >/dev/null
apt-get install -y -qq git ansible sshpass wget gnupg2 curl >/dev/null

echo "[2] : Installation de java & jenkins"
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb https://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
apt-get update -qq -y >/dev/null
apt-get install -y -qq default-jre jenkins >/dev/null
systemctl enable jenkins
systemctl restart jenkins

echo "[3] : Customisation de Ansible "
sed -i 's/.*pipelining.*/pipelining = True' /etc/ansible/ansible.cfg
sed -i 's/.*allow_world_readable_tmpfiles.*/allow_world_readable_tmpfiles = True' /etc/ansible/ansible.cfg

echo "[4] : Installation de docker & docker-compose"
apt-get update -y -qq >/dev/null
apt-get install -y -qq docker.io docker-compose >/dev/null
usermod -aG docker jenkins

echo "[5] : utilisation du registry sans ssl"
echo "
        {
            \"insecure-registry\" : [\"192.168.100.20:5000\"]
        }
   " >/etc/docker/daemon.json
systemctl daemon-reload


