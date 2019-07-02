Load Balancing Web Servers
==========================

Load balancing two simple webserver using Nginx as Proxy Server and Vagrant as virtualization environment.

# What I have done

* Creates 3 VM one for nginx and Other for two simple Web Servers.
* Nginx will route traffic either to webserver1 or webserver2 based on load balancing mechanism.
* If one of webserver is down automatically traffic is redirected to another server.
* Once vagrant command the VM's are created and Nginx is installed in all machines. The configuration differs based on type of machine either to act as proxy or webserver.

# Installation Steps

This entire setup can be used in any Operating System. For this demo to run we need to install VirtualBox, Vagrant and Git in local machine.

* [Windows](https://www.swtestacademy.com/quick-start-vagrant-windows-10/)
* [Ubuntu](https://phoenixnap.com/kb/how-to-install-vagrant-on-ubuntu)
* [Centos](https://www.tecmint.com/how-to-install-vagrant-on-centos-7/)

# Repository Structure

* Vagrantfile - File used by vagrant to create VM's.
* web-setup.sh - Shell Script to install and configure static page webserver (Nginx) in Web Server VM's
* lb-setup.sh - Shell Script to install and configure nginx in Load Balancing VM.

# Getting started
1. After installing required tools, open the terminal (PowerShell/cmd for windows) clone the repo.
    ```
    git clone https://github.com/vsp6692/alation-assignment.git
    ```
2. Change Directory to alation-assignment.
    ```
    cd alation-assignment
    ```
3. Make vagrant boxes up.
    ``` 
    vagrant up 
    ```
4. It takes some time to create all machines. Once above steps has ran successfully run below command to verify whether machines has been created.
    ``` 
    vagrant global-status
    ```
5. Three machines will be created with below settings.

| Machine | IP | Ports Open 
------------|---------------|------------
| nginx | 192.168.100.10 |  80 (Load Balanced Nginx)
| webserver1 | 192.100.100.11 | 80 (Nginx Webserver)
| webserver2 | 192.100.100.12 | 80 (Nginx Webserver)

6. To access the webserver across load balancer open [http://192.168.10.10](http://192.168.10.10) in browser or run curl command


# Additional Steps

* To login into machine run 
    ``` 
    vagrant ssh $MACHINE_NAME 
    ```
* To make changes to nginx, ssh in to loadbalancer machine, update config file and reload nginx.
    ```
    sudo vim /etc/nginx/sites-available/default
    sudo service nginx reload 
    ```
* Open [http://192.168.10.11 - webserver1](http://192.168.10.11) and [http://192.168.10.12 - webserver2](http://192.168.10.12)  in a browser to see if individual Nginx is working.
* To see the Nginx access logs run below commands
    ``` 
    vagrant ssh webserver1 or vagrant ssh webserver2
    sudo tail -f /var/log/nginx/access.log
    ```
* To stop Nginx on one of the webservers run and test the load balancer stop one of the webserver. 
    ``` 
    vagrant ssh webserver1 or vagrant ssh webserver2
    sudo service Nginx2 stop
    ``` 
  To start it again, run 
    ```
    sudo service Nginx2 start
    ```
* To clean the machines run
    ```
    vagrant destroy
    ```