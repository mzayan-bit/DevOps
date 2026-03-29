#!/bin/bash

#for  creating a compressed archive of all bash scripts

# step 1: define your registration number
reg="u2023554"

# step 2: create tar.gz archive of all .sh files
# *.sh means all bash scripts in current folder
tar -czf ${reg}.tar.gz *.sh

# step 3: create final zip in home directory
# as required in submission instructions
zip ~/assignment2_${reg}.zip *.sh

# print success message
echo "all scripts archived successfully"
echo "files created:"
echo "${reg}.tar.gz"
echo "assignment2_${reg}.zip"
