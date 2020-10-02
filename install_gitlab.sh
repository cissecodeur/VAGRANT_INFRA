#!/bin/bash
IP = $(hostname - I | awk '{print $2}')
echo "START - install gitlab - "$IP

echo "[1] : Debut install gitlab"
sudo apt-get update -y -qq >/dev/null
sudo apt-get install -y -qq vim curl wget git >/dev/null
curl -sS https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.deb.sh | sudo bash
sudo apt-get update -y -qq >/dev/null
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
sudo apt-get install gitlab-ce
sudo gitlab-ctl reconfigure
echo "[1] : Fin install gitlab"
