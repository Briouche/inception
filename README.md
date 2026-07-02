*This project has been created as part of the 42 curriculum by brcoppie*

# **Inception**

## **Description**

Inception is a project about learning the ways of docker and multi-image building (magic).
The objective is to link 3 different containers: mariadb for database, nginx for the web-server and worpress building and managing a website.
All this using compose. A virtual machine is used to have sudo privileges.

secrets:
    Secrets are safer and not as risky to leak when scaling a system, but were not used in this project. For a project of this scale .env file is entirely sufficient.

VM vs docker : 
    docker containers let you create a seperated environnement without having to setup and download a whole new operating system

Bind mounts vs docker volumes: 
    both are used to save memory from a container after it stops, so you can restart it and still have your modifications. Docker volumes are entirely managed by docker, while you can choose where the data is saved in your directory structure for bind mounts. In this project we are not allowed to use bind mounts, but it is still requested that we choose where data is saved (/home/data/...), so we use a cheaky trick to force docker volumes to bind to a specific dir.

docker network vs host network:
    a docker host network is a docker network that shares the host machine's stack directly, the container doesn't get it's own IP adress, it shares the host's IP and exposes ports directly on the host.

## **Instructions**

Use make up for launching, make down to delete containers. make fclean to delete mounted volumes and images too. For more makefile commands look in User_doc.

## **Resources**

learning docker with official hub - https://www.docker.com/get-started/

other introduction to docker - https://docker-curriculum.com

tutorial for setting up the different containers - https://tuto.grademe.fr/inception/ 

AI use (claude): looking up command syntax and help understanding terminal errors

