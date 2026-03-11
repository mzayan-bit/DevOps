#!/bin/bash
cat <<EOF>site.conf
<VirtualHost *:80>
ServerName example.com
DocumentRoot /var/www/example
</VirtualHost>
EOF
