Additional Bonus Document
=========================

# Brief Summary of what you liked about your solution

* The solution is simple and straightforward.
* It can be easily replicated in any system which is OS agnostic.
* Number of tools used is very minimal.
* People with minimal knowledge or new to concept can easily learn and implement the same.
* Solution is lightweight so it can be used in deploying simple applications.

# Brief summary of what you disliked about your solution

* The current solution is limited to simple setup and can be used only for learning purpose.
* Solution is very static like number of machines, IP, etc., which can be made more dynamic.
* Would have done demo by deploying high level application like having frontend, backend and DB which would be more like production environment.
* Scaling the machines is not possible in current solution.

# Configurable Round Robin / Sticky Load Balancer

* Nginx supports multiple load balancing mechanisms Round Robin, Least Connection and Ip-Hash(Sticky Session). You can see "lb-setup.sh" to change mechanism. 
* This can be implemented by ssh into machine and change configuration manually or by destroying VM's and recreating by changing lb-setup.sh file.

# Return instance identifier of your webserver in addition to “Hello World”

* Implemented in both webservers. It displays the webserver name in the body and head.