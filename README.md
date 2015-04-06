# Vagrant RabbitMq Box

## About

This box contains a vagrant / puppet recipe that allows you to create a develop environment with RabbitMq and RabbitMq Web Management

## Install

* Download and install [Vagrant](http://downloads.vagrantup.com/)
* Download and install  [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
* Clone the project ```git clone --recursive https://github.com/chris-redekop/vagrant-rabbitmq.git```; **_NOTE THE ```--recursive``` IN THE CLONE COMMAND!_**
* In the project dir run ```vagrant up```

## Installed Services

All of the installed services are portmapped from the guest VM to the host OS.  This means, for example, that you can access the web client by navigating to http://localhost:15672 from a browser running _on your Windows desktop_.

### RabbitMQ

host: localhost  
port: 5672  

### RabbitMQ Web client

url: http://localhost:15672/  
username: guest  
password: guest  

## Additional Files

The ```send.py``` and ```receive.py``` scripts (and their dependencies) from [RabbitMQ's "Hello World!" tutorial](https://www.rabbitmq.com/tutorials/tutorial-one-python.html) are installed in the ```vagrant``` user's home directory.  You can run these scripts as a smoke test on the new server:

```bash
$ vagrant ssh
Welcome to Ubuntu 14.04.2 LTS (GNU/Linux 3.13.0-48-generic x86_64)

... SNIP ...

vagrant@vagrant-ubuntu-trusty-64:~$ ./send.py
 [x] Sent 'Hello World!'
vagrant@vagrant-ubuntu-trusty-64:~$ ./receive.py
 [*] Waiting for messages. To exit press CTRL+C
 [x] Received 'Hello World!'
^CTraceback (most recent call last):

... SNIP ...

KeyboardInterrupt
vagrant@vagrant-ubuntu-trusty-64:~$
```

## Vagrant basic commands

* start box: ```vagrant up```
* ssh into box: ```vagrant ssh```
* shutdown box: ```vagrant halt```
* suspend box: ```vagrant suspend``
* destroy box: ```vagrant destroy```

## Links: 
-  [Vagrant](http://downloads.vagrantup.com/)
-  [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
