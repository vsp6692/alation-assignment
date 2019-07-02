#!/bin/bash
export DEBIAN_FRONTEND=noninteractive

if [ ! -f /etc/network/if-up.d/custom-network-config ]; then

  # Install and configure Nginx
  /usr/bin/apt-get -y install nginx
  cat > /var/www/html/index.nginx-debian.html <<EOD
<html><head><title>webserver1</title></head><center>Hello World!</center><font color="red" size="20"><b><center> You are in Server webserver1</center></b></font><div style="position: absolute; bottom: 5px;"><u><h3>Refrences:</h3></u><ul style="list-style-type:disc;"><li><a href="https://github.com/vsp6692/alation-assignment/blob/master/README.md">Readme Documentation</a></li><li><a href="https://github.com/vsp6692/alation-assignment/blob/master/BONUS.md">Bonus Documentation</a></li><li><a href="https://github.com/vsp6692/alation-assignment">GIT Repo</a></li></ul></div></html>
EOD
  
  #Restart Nginx
  /usr/sbin/service nginx restart
  update-rc.d nginx defaults

fi