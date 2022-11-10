#!/bin/bash
sudo docker swarm init --advertise-addr=10.10.10.100
sudo docker swarm join-token worker
sudo docker volume create app
cd /var/lib/docker/volumes/app/_data
sudo docker service create --name meu-app --replicas 5 -dt -p 80:80 --mount type=volume,src=app,dst=/usr/local/apache2/htdocs/ httpd
sudo apt-get install nfs-server
nano /etc/exports > cd /var/lib/docker/volumes/app/_data *(rw,sync,subtree_check)
exportfs -ar
sudo apt-get install nfs-common
sudo mount 172.21.13.219:/var/lib/docker/volumes/app/_data /var/lib/docker/volumes/app/_data
cd /var/lib/docker/volumes/app/_data
sudo nano index.html > <h1> MEU SITE </h1>
