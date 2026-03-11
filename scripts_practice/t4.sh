#!/bin/bash
cat <<EOF>system_info.txt
 "System Report"
 User : $USER
 Home : $HOME
 Date : $(date)
EOF
