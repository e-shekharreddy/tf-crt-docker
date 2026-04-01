#!/bin/bash

# we are creating 50Gb root disk, but only 20gb is partioned 
# reamaing 30GB we need to exted using below commands
growpart /dev/nvme0n1 4
lvextend -L +30G /dev/RootVG/varVol
xfs_growfs /var


dnf -y install dnf-plugins-core
dnf config-manager --add-repo https://download.docker.com/linux/rhel/docker-ce.repo
dnf install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
systemctl enable docker
systemctl start docker
usermod -aG docker ec2-user
