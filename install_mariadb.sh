#!/bin/bash
#####Installation de postgresql

IP = $(hostname -I | awk {'print $2'})
echo "Install de mariadb sur" - $IP

echo "[1]: Install de mariadb"

sudo apt-get update -qq -y >/dev/null
sudo apt-get install -qq -y curl wget git vim >/dev/null
sudo apt-get install software-properties-common -qq -y >/dev/null
sudo apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xF1656F24C74CD1D8 -qq -y >/dev/null
sudo add-apt-repository "deb [arch=amd64,arm64,ppc64el] http://mariadb.mirror.liquidtelecom.com/repo/10.4/ubuntu $(lsb_release -cs) main" -qq -y >/dev/null
sudo apt update -qq -y >/dev/null
sudo apt install mariadb-server mariadb-client -qq -y >/dev/null 
sed -i 's/bind-address = 127.0.0.1 /bind-address = 0.0.0.0/g' /etc/mysql/my.cnf
sudo systemctl restart mariadb.service

echo "Fin Installation"

### CREATE USER 'nouveau_utilisateur'@'localhost' IDENTIFIED BY 'mot_de_passe';
### GRANT ALL PRIVILEGES ON * . * TO 'nouveau_utilisateur'@'localhost';
### FLUSH PRIVILEGES

