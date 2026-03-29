#!/bin/bash

#3.1 creating ssh key pair and saving it 
sudo -u devopsuser ssh-keygen -t rsa -f /home/devopsuser/.ssh/id_rsa -N ""

#3.2 disbale password authentication 
sudo sed -i 's/^#PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config

sudo systemctl restart ssh

#3.3
cat <<EOF > /home/devopsuser/.ssh/config
Host myserver
    HostName localhost
    User devopsuser
EOF

# Run non-interactive SSH commands
ssh devopsuser@localhost "mkdir -p ~/testdir"
ssh devopsuser@localhost "echo 'I am doing task3' > ~/testdir/filecreatedinnoninteractivemode.txt"



