#!/bin/bash

sudo adduser devopsuser #creating user 
sudo groupadd devopsgroup #creating group 
sudo usermod -aG devopsgroup devopsuser #add user to group 

