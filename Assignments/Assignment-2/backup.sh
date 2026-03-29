#!/bin/bash

# this script creates a backup of /devopsdir and also sets a cron job to run every 10 minutes

# step 1: define backup directory inside devopsuser home
backup_dir="/home/devopsuser/backup"

# step 2: create backup directory if it does not exist
sudo mkdir -p "$backup_dir"

# step 3: create a compressed backup file with date and time
# this makes each file unique
sudo tar -czf "$backup_dir/backup_$(date +%F_%H-%M-%S).tar.gz" /devopsdir

# step 4: print message so user knows backup worked
echo "backup created at $(date)"
# step 5: add cron job to run this script every 10 minutes
# first part keeps existing cron jobs
# second part adds new job
(crontab -l 2>/dev/null; echo "*/10 * * * * sudo /home/devopsuser/backup.sh") | crontab -

# step 6: print confirmation
echo "cron job added to run every 10 minutes"
