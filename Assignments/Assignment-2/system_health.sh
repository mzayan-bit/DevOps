#!/bin/bash

# this script creates a simple system health html report
# and hosts it using nginx

# step 1: get current date
current_date=$(date)
# step 2: get memory information

# total memory in mb
mem_total=$(free -m | awk '/Mem:/ {print $2"Mb"}')

# used memory percentage
mem_used=$(free | awk '/Mem:/ {printf("%.2f%%"), $3/$2 * 100}')

# available memory percentage
mem_avail=$(free | awk '/Mem:/ {printf("%.2f%%"), $7/$2 * 100}')

# step 3: get swap memory info

swap_total=$(free -m | awk '/Swap:/ {print $2"Mb"}')
swap_used=$(free | awk '/Swap:/ {printf("%.2f%%"), $3/$2 * 100}')
swap_avail=$(free | awk '/Swap:/ {printf("%.2f%%"), $4/$2 * 100}')

# step 4: get disk usage
# exclude tmpfs and only take real disks

disk_info=$(df -h --exclude=tmpfs | grep "^/dev")

# step 5: create html file using heredoc

cat <<EOF > system_health.html
<html>
<head>
<title>system health report</title>
</head>

<body>

<h1>system health report</h1>

<p>generated on: $current_date</p>

<h2>memory usage</h2>
<table border="1">
<tr><th>total</th><th>used</th><th>available</th></tr>
<tr><td>$mem_total</td><td>$mem_used</td><td>$mem_avail</td></tr>
</table>

<h2>swap memory</h2>
<table border="1">
<tr><th>total</th><th>used</th><th>available</th></tr>
<tr><td>$swap_total</td><td>$swap_used</td><td>$swap_avail</td></tr>
</table>

<h2>disk details</h2>
<pre>
$disk_info
</pre>

<p>designed by: u2023554</p>

</body>
</html>
EOF

# step 6: host using nginx
# copy html to nginx default folder
sudo cp system_health.html /var/www/html/index.html

# restart nginx
sudo systemctl restart nginx

