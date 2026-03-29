#!/bin/bash

# this script installs or deletes lamp stack with logging


# step 1: create log file
LOGFILE="lamp-setup-u2023554.log"

# function to write logs with date
log() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" >> $LOGFILE
}

# step 2: read command line options
install=false
delete=false
webserver="Apache"   # default

while [[ $# -gt 0 ]]
do
    case $1 in
        -i) install=true ;;
        -d) delete=true ;;
        -ws) webserver=$2; shift ;;
    esac
    shift
done

# log start
log "script started"

# step 3: install section
if [ "$install" = true ]; then

    log "installation started"

    # check existing web servers
    if systemctl is-active --quiet apache2; then
        echo "apache already installed"
        read -p "remove apache? (Y/n): " ans
        if [[ "$ans" == "Y" || "$ans" == "y" ]]; then
            sudo apt remove apache2 -y
            log "apache removed"
        fi
    fi

    if systemctl is-active --quiet nginx; then
        echo "nginx already installed"
        read -p "remove nginx? (Y/n): " ans
        if [[ "$ans" == "Y" || "$ans" == "y" ]]; then
            sudo apt remove nginx -y
            log "nginx removed"
        fi
    fi

    # install selected web server
    if [ "$webserver" = "Apache" ]; then
        sudo apt install apache2 -y
        log "apache installed"
    else
        sudo apt install nginx -y
        log "nginx installed"
    fi

 # install php
    if dpkg -l | grep -q php; then
        echo "php already installed"
        log "php already installed"
    else
        sudo apt install php libapache2-mod-php php-mysql -y
        log "php installed"
    fi

   # install mysql
    if systemctl is-active --quiet mysql; then
        echo "mysql already installed"
        log "mysql already installed"
    else
        sudo apt install mysql-server -y
        log "mysql installed"

        # generate random password
        dbpass=$(openssl rand -base64 10)
        echo "mysql root password: $dbpass"
        log "mysql password generated"
    fi

    echo "installation completed"
    log "installation completed"
fi
# step 4: delete section
    if [ "$delete" = true ]; then

    echo "warning: this will delete lamp stack"
    read -p "are you sure? (Y/n): " confirm

    if [[ "$confirm" == "Y" || "$confirm" == "y" ]]; then
        sudo apt remove apache2 nginx mysql-server php -y
        log "lamp stack removed"
        echo "deleted successfully"
    else
        echo "operation cancelled"
        log "delete cancelled"
    fi
fi

# end log
log "script ended"
