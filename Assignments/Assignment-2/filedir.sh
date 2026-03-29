#!/bin/bash

#4.1
sudo mkdir -p /devopsdir #create directory 

#4.2 
# Creates a directory and writes a message to a file with root privileges.
# Uses 'sudo tee' to bypass permission restrictions while displaying the output.
echo "AoA, Hello DevOps!" | sudo tee /devopsdir/devopsfile.txt

#change ownership to devopsuser
sudo chown devopsuser /devopsdir/devopsfile.txt

#set file permissions (read/write for owner, read for others)
sudo chmod 664 /devopsdir/devopsfile.txt

#set directory permissions (rwx for owner, rx for others)
sudo chmod 755 /devopsdir








