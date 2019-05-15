#!/bin/bash

# Install MariaDB without password prompt
# Set username to 'root' and password to 'mariadb_root_password' (see Vagrantfile)
# sudo export DEBIAN_FRONTEND="noninteractive"
sudo debconf-set-selections <<< "maria-db-10.3 mysql-server/root_password password debian"
sudo debconf-set-selections <<< "maria-db-10.3 mysql-server/root_password_again password debian"