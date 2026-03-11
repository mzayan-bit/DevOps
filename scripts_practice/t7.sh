#!/bin/bash

echo "Enter username"
read name 

echo "Enter Course"
read course

cat <<EOF>user_info.txt
User information
Name : $name
Course : $course
Date : $(date)
EOF
