#!/bin/bash
export DEBIAN_FRONTEND=noninteractive

if [ ! -f /etc/nginx/nginx.cfg ]; then

  # Install Nginx
  /usr/bin/apt-get -y install nginx

  # Configure Nginx

  cat > /etc/nginx/sites-available/default <<EOD
upstream backend {
  #ip_hash; A hash-function is used to determine what server should be selected for the next request (based on the client’s IP address).
  #least_conn; Next request is assigned to the server with the least number of active connections.
  # no load balancing method is specified for Round Robin
  server 192.168.10.11;
  server 192.168.10.12;
}

server {
  listen 80;
  location / {
      proxy_pass http://backend;
  }
}
EOD

  #Restart Nginx
  /usr/sbin/service nginx restart
  update-rc.d nginx defaults

fi
